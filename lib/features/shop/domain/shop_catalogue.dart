import 'package:flutter/foundation.dart';

import '../../profile/domain/personalization.dart';
import 'product.dart';

/// How the shop list is ordered.
enum ShopSort { recommended, priceAsc, priceDesc, rating, newest }

/// The shop's filter state.
@immutable
class ShopFilter {
  const ShopFilter({
    this.category,
    this.query = '',
    this.maxPrice,
    this.localBrandsOnly = false,
    this.discountedOnly = false,
    this.sort = ShopSort.recommended,
  });

  final ProductCategory? category;
  final String query;

  /// Upper price bound in tenge, or null for no limit.
  final int? maxPrice;
  final bool localBrandsOnly;
  final bool discountedOnly;
  final ShopSort sort;

  bool get isActive =>
      category != null ||
      query.trim().isNotEmpty ||
      maxPrice != null ||
      localBrandsOnly ||
      discountedOnly;

  ShopFilter copyWith({
    ProductCategory? category,
    bool clearCategory = false,
    String? query,
    int? maxPrice,
    bool clearMaxPrice = false,
    bool? localBrandsOnly,
    bool? discountedOnly,
    ShopSort? sort,
  }) {
    return ShopFilter(
      category: clearCategory ? null : (category ?? this.category),
      query: query ?? this.query,
      maxPrice: clearMaxPrice ? null : (maxPrice ?? this.maxPrice),
      localBrandsOnly: localBrandsOnly ?? this.localBrandsOnly,
      discountedOnly: discountedOnly ?? this.discountedOnly,
      sort: sort ?? this.sort,
    );
  }
}

/// Filters and sorts the shop. Pure, so the age gate and the price filter
/// are unit-tested.
class ShopCatalogue {
  const ShopCatalogue();

  /// Categories she may browse: intimate health is hidden from minors.
  List<ProductCategory> categoriesFor(AgeGroup? ageGroup) => [
    for (final category in ProductCategory.values)
      if (!(category.isAdultOnly && (ageGroup?.isUnder16 ?? false))) category,
  ];

  List<Product> apply({
    required List<Product> products,
    required ShopFilter filter,
    AgeGroup? ageGroup,
    LifeStage? lifeStage,
    List<Interest> interests = const [],
    Set<String> localSellerIds = const {},
  }) {
    final query = filter.query.trim().toLowerCase();
    final result = [
      for (final product in products)
        if (_matches(
          product: product,
          filter: filter,
          query: query,
          ageGroup: ageGroup,
          localSellerIds: localSellerIds,
        ))
          product,
    ];

    result.sort(
      (a, b) => switch (filter.sort) {
        ShopSort.priceAsc => a.price.compareTo(b.price),
        ShopSort.priceDesc => b.price.compareTo(a.price),
        ShopSort.rating => b.rating.compareTo(a.rating),
        ShopSort.newest => b.reviewCount.compareTo(a.reviewCount),
        ShopSort.recommended => _relevance(
          b,
          lifeStage,
          interests,
        ).compareTo(_relevance(a, lifeStage, interests)),
      },
    );
    return result;
  }

  bool _matches({
    required Product product,
    required ShopFilter filter,
    required String query,
    required AgeGroup? ageGroup,
    required Set<String> localSellerIds,
  }) {
    if (product.category.isAdultOnly && (ageGroup?.isUnder16 ?? false)) {
      return false;
    }
    if (filter.category != null && product.category != filter.category) {
      return false;
    }
    if (filter.maxPrice != null && product.price > filter.maxPrice!) {
      return false;
    }
    if (filter.discountedOnly && !product.isDiscounted) return false;
    if (filter.localBrandsOnly && !localSellerIds.contains(product.sellerId)) {
      return false;
    }
    if (query.isEmpty) return true;

    final haystack = [
      ...product.title.values.values,
      ...product.description.values.values,
    ].join(' ').toLowerCase();
    return haystack.contains(query);
  }

  /// Highest price in the catalogue, for the price slider's bound.
  int maxPriceIn(List<Product> products) => products.fold(
    0,
    (max, product) => product.price > max ? product.price : max,
  );

  static int _relevance(
    Product product,
    LifeStage? stage,
    List<Interest> interests,
  ) {
    var score = 0;
    if (stage != null && product.stages.contains(stage)) score += 6;
    score += 3 * product.interests.where(interests.contains).length;
    if (product.isDiscounted) score += 1;
    // Rating breaks ties without ever outweighing a stage match.
    return score * 1000 + (product.rating * 100).round();
  }
}
