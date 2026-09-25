import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';
import '../../profile/domain/personalization.dart';
import '../../tracker/domain/tracker_enums.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Shop sections.
enum ProductCategory {
  periodCare,
  pregnancy,
  baby,
  beauty,
  wellness,
  intimateHealth,
  subscriptionBox;

  bool get isAdultOnly => this == ProductCategory.intimateHealth;
}

/// An item for sale. Prices are in tenge, stored as whole units.
@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required ProductCategory category,
    @LocalizedTextConverter() required LocalizedText title,
    @LocalizedTextConverter() required LocalizedText description,

    /// Price in KZT.
    required int price,

    /// Original price when discounted, always higher than [price].
    int? oldPrice,
    required String sellerId,
    @Default(<String>[]) List<String> imageUrls,
    @Default(0) double rating,
    @Default(0) int reviewCount,
    @Default(true) bool inStock,

    /// Cycle phases this is useful in, used for timed offers.
    @Default(<CyclePhase>[]) List<CyclePhase> phases,
    @Default(<LifeStage>[]) List<LifeStage> stages,
    @Default(<Interest>[]) List<Interest> interests,

    /// Bundle contents, e.g. the Hospital Bag Bundle.
    @Default(<String>[]) List<String> bundleProductIds,

    /// Links a bundle to the article that recommends it.
    String? relatedContentId,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  bool get isBundle => bundleProductIds.isNotEmpty;

  bool get isDiscounted => oldPrice != null && oldPrice! > price;

  /// Whole-percent discount, or null when not on offer.
  int? get discountPercent =>
      isDiscounted ? (100 * (oldPrice! - price) / oldPrice!).round() : null;
}
