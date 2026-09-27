// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shopCatalogue)
final shopCatalogueProvider = ShopCatalogueProvider._();

final class ShopCatalogueProvider
    extends $FunctionalProvider<ShopCatalogue, ShopCatalogue, ShopCatalogue>
    with $Provider<ShopCatalogue> {
  ShopCatalogueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopCatalogueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopCatalogueHash();

  @$internal
  @override
  $ProviderElement<ShopCatalogue> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShopCatalogue create(Ref ref) {
    return shopCatalogue(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShopCatalogue value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShopCatalogue>(value),
    );
  }
}

String _$shopCatalogueHash() => r'21d07477a478af917d7997e19d727ea20e76a735';

@ProviderFor(productRecommender)
final productRecommenderProvider = ProductRecommenderProvider._();

final class ProductRecommenderProvider
    extends
        $FunctionalProvider<
          ProductRecommender,
          ProductRecommender,
          ProductRecommender
        >
    with $Provider<ProductRecommender> {
  ProductRecommenderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRecommenderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRecommenderHash();

  @$internal
  @override
  $ProviderElement<ProductRecommender> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRecommender create(Ref ref) {
    return productRecommender(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRecommender value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRecommender>(value),
    );
  }
}

String _$productRecommenderHash() =>
    r'6c786c4a2ead46bfa2234625ef4cc150c1559224';

@ProviderFor(reviewRepository)
final reviewRepositoryProvider = ReviewRepositoryProvider._();

final class ReviewRepositoryProvider
    extends
        $FunctionalProvider<
          ReviewRepository,
          ReviewRepository,
          ReviewRepository
        >
    with $Provider<ReviewRepository> {
  ReviewRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReviewRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReviewRepository create(Ref ref) {
    return reviewRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReviewRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReviewRepository>(value),
    );
  }
}

String _$reviewRepositoryHash() => r'5c72d520f325685316677fcb6d6670ad918e2179';

@ProviderFor(cartRepository)
final cartRepositoryProvider = CartRepositoryProvider._();

final class CartRepositoryProvider
    extends $FunctionalProvider<CartRepository, CartRepository, CartRepository>
    with $Provider<CartRepository> {
  CartRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartRepositoryHash();

  @$internal
  @override
  $ProviderElement<CartRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CartRepository create(Ref ref) {
    return cartRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartRepository>(value),
    );
  }
}

String _$cartRepositoryHash() => r'b03525569ed1d9aa29f0ca8ee13a560b8cfe8bbe';

@ProviderFor(orderRepository)
final orderRepositoryProvider = OrderRepositoryProvider._();

final class OrderRepositoryProvider
    extends
        $FunctionalProvider<OrderRepository, OrderRepository, OrderRepository>
    with $Provider<OrderRepository> {
  OrderRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrderRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrderRepository create(Ref ref) {
    return orderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderRepository>(value),
    );
  }
}

String _$orderRepositoryHash() => r'18e3b6a61e6ea2e42addce9000191ab48fb8a257';

@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider = SubscriptionRepositoryProvider._();

final class SubscriptionRepositoryProvider
    extends
        $FunctionalProvider<
          SubscriptionRepository,
          SubscriptionRepository,
          SubscriptionRepository
        >
    with $Provider<SubscriptionRepository> {
  SubscriptionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubscriptionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubscriptionRepository create(Ref ref) {
    return subscriptionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscriptionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscriptionRepository>(value),
    );
  }
}

String _$subscriptionRepositoryHash() =>
    r'759fd89dbc2e6d937d41c51ce3974d043c8c03a7';

/// The payment provider.
///
/// Kaspi Pay needs a merchant backend, so the mock runs until that exists.
/// Swap in [KaspiPaymentService] here once the endpoints are live.

@ProviderFor(paymentService)
final paymentServiceProvider = PaymentServiceProvider._();

/// The payment provider.
///
/// Kaspi Pay needs a merchant backend, so the mock runs until that exists.
/// Swap in [KaspiPaymentService] here once the endpoints are live.

final class PaymentServiceProvider
    extends $FunctionalProvider<PaymentService, PaymentService, PaymentService>
    with $Provider<PaymentService> {
  /// The payment provider.
  ///
  /// Kaspi Pay needs a merchant backend, so the mock runs until that exists.
  /// Swap in [KaspiPaymentService] here once the endpoints are live.
  PaymentServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentServiceHash();

  @$internal
  @override
  $ProviderElement<PaymentService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PaymentService create(Ref ref) {
    return paymentService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentService>(value),
    );
  }
}

String _$paymentServiceHash() => r'7a345582d4e4e63a0b36cf3776af5c1f55a96675';

@ProviderFor(reviews)
final reviewsProvider = ReviewsProvider._();

final class ReviewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Review>>,
          List<Review>,
          FutureOr<List<Review>>
        >
    with $FutureModifier<List<Review>>, $FutureProvider<List<Review>> {
  ReviewsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewsHash();

  @$internal
  @override
  $FutureProviderElement<List<Review>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Review>> create(Ref ref) {
    return reviews(ref);
  }
}

String _$reviewsHash() => r'34566c820147bbccc036a79d535456174f0104ae';

/// Products keyed by id, for pricing the cart.

@ProviderFor(productsById)
final productsByIdProvider = ProductsByIdProvider._();

/// Products keyed by id, for pricing the cart.

final class ProductsByIdProvider
    extends
        $FunctionalProvider<
          Map<String, Product>,
          Map<String, Product>,
          Map<String, Product>
        >
    with $Provider<Map<String, Product>> {
  /// Products keyed by id, for pricing the cart.
  ProductsByIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsByIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsByIdHash();

  @$internal
  @override
  $ProviderElement<Map<String, Product>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, Product> create(Ref ref) {
    return productsById(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Product>>(value),
    );
  }
}

String _$productsByIdHash() => r'da0b2e53d07ec8f47179fb907b6436406b31e726';

/// Sellers whose products carry the "local brand" badge.

@ProviderFor(localSellerIds)
final localSellerIdsProvider = LocalSellerIdsProvider._();

/// Sellers whose products carry the "local brand" badge.

final class LocalSellerIdsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  /// Sellers whose products carry the "local brand" badge.
  LocalSellerIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSellerIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSellerIdsHash();

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    return localSellerIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$localSellerIdsHash() => r'01ca7719986de4c19d89bb1da904dac058b3e032';

@ProviderFor(reviewsForProduct)
final reviewsForProductProvider = ReviewsForProductFamily._();

final class ReviewsForProductProvider
    extends $FunctionalProvider<List<Review>, List<Review>, List<Review>>
    with $Provider<List<Review>> {
  ReviewsForProductProvider._({
    required ReviewsForProductFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'reviewsForProductProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reviewsForProductHash();

  @override
  String toString() {
    return r'reviewsForProductProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Review>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Review> create(Ref ref) {
    final argument = this.argument as String;
    return reviewsForProduct(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Review> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Review>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewsForProductProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reviewsForProductHash() => r'aaeccdd4726d9b63d6b50d09a9a2d347cbe61f62';

final class ReviewsForProductFamily extends $Family
    with $FunctionalFamilyOverride<List<Review>, String> {
  ReviewsForProductFamily._()
    : super(
        retry: null,
        name: r'reviewsForProductProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReviewsForProductProvider call(String productId) =>
      ReviewsForProductProvider._(argument: productId, from: this);

  @override
  String toString() => r'reviewsForProductProvider';
}

/// The shop's filters.

@ProviderFor(ShopFilterController)
final shopFilterControllerProvider = ShopFilterControllerProvider._();

/// The shop's filters.
final class ShopFilterControllerProvider
    extends $NotifierProvider<ShopFilterController, ShopFilter> {
  /// The shop's filters.
  ShopFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopFilterControllerHash();

  @$internal
  @override
  ShopFilterController create() => ShopFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShopFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShopFilter>(value),
    );
  }
}

String _$shopFilterControllerHash() =>
    r'b662f43a6953222a0232070a816cb56b9bd952f1';

/// The shop's filters.

abstract class _$ShopFilterController extends $Notifier<ShopFilter> {
  ShopFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ShopFilter, ShopFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ShopFilter, ShopFilter>,
              ShopFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The filtered, sorted shop list.

@ProviderFor(shopResults)
final shopResultsProvider = ShopResultsProvider._();

/// The filtered, sorted shop list.

final class ShopResultsProvider
    extends $FunctionalProvider<List<Product>, List<Product>, List<Product>>
    with $Provider<List<Product>> {
  /// The filtered, sorted shop list.
  ShopResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopResultsHash();

  @$internal
  @override
  $ProviderElement<List<Product>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Product> create(Ref ref) {
    return shopResults(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Product>>(value),
    );
  }
}

String _$shopResultsHash() => r'72c37099379026e058d07c51dc8639ca183cac62';

@ProviderFor(shopCategories)
final shopCategoriesProvider = ShopCategoriesProvider._();

final class ShopCategoriesProvider
    extends
        $FunctionalProvider<
          List<ProductCategory>,
          List<ProductCategory>,
          List<ProductCategory>
        >
    with $Provider<List<ProductCategory>> {
  ShopCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<ProductCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProductCategory> create(Ref ref) {
    return shopCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProductCategory> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProductCategory>>(value),
    );
  }
}

String _$shopCategoriesHash() => r'dc240b2ad49192fc68925065b70417886b9cac8e';

/// Why the "for you" row shows what it shows.

@ProviderFor(shopOfferReason)
final shopOfferReasonProvider = ShopOfferReasonProvider._();

/// Why the "for you" row shows what it shows.

final class ShopOfferReasonProvider
    extends $FunctionalProvider<OfferReason, OfferReason, OfferReason>
    with $Provider<OfferReason> {
  /// Why the "for you" row shows what it shows.
  ShopOfferReasonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopOfferReasonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopOfferReasonHash();

  @$internal
  @override
  $ProviderElement<OfferReason> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OfferReason create(Ref ref) {
    return shopOfferReason(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OfferReason value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OfferReason>(value),
    );
  }
}

String _$shopOfferReasonHash() => r'055ca515dcf2e23d7a1495d20bac5d78e28e689f';

/// Products recommended from the tracker forecast and her life stage.

@ProviderFor(recommendedProducts)
final recommendedProductsProvider = RecommendedProductsProvider._();

/// Products recommended from the tracker forecast and her life stage.

final class RecommendedProductsProvider
    extends $FunctionalProvider<List<Product>, List<Product>, List<Product>>
    with $Provider<List<Product>> {
  /// Products recommended from the tracker forecast and her life stage.
  RecommendedProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recommendedProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recommendedProductsHash();

  @$internal
  @override
  $ProviderElement<List<Product>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Product> create(Ref ref) {
    return recommendedProducts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Product>>(value),
    );
  }
}

String _$recommendedProductsHash() =>
    r'42e12c4b50a18400222316b8b8159fa3895375d4';

@ProviderFor(productById)
final productByIdProvider = ProductByIdFamily._();

final class ProductByIdProvider
    extends $FunctionalProvider<Product?, Product?, Product?>
    with $Provider<Product?> {
  ProductByIdProvider._({
    required ProductByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productByIdHash();

  @override
  String toString() {
    return r'productByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Product?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Product? create(Ref ref) {
    final argument = this.argument as String;
    return productById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Product? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Product?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productByIdHash() => r'f04093236bb1acb3ddf7dbec2b86156975dc6d60';

final class ProductByIdFamily extends $Family
    with $FunctionalFamilyOverride<Product?, String> {
  ProductByIdFamily._()
    : super(
        retry: null,
        name: r'productByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductByIdProvider call(String id) =>
      ProductByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'productByIdProvider';
}

/// Her cart.

@ProviderFor(CartController)
final cartControllerProvider = CartControllerProvider._();

/// Her cart.
final class CartControllerProvider
    extends $NotifierProvider<CartController, Cart> {
  /// Her cart.
  CartControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartControllerHash();

  @$internal
  @override
  CartController create() => CartController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Cart value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Cart>(value),
    );
  }
}

String _$cartControllerHash() => r'a84b3efe97f7dc56270192f91974524b043d47ad';

/// Her cart.

abstract class _$CartController extends $Notifier<Cart> {
  Cart build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Cart, Cart>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Cart, Cart>,
              Cart,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Cart totals against the live catalogue.

@ProviderFor(cartTotals)
final cartTotalsProvider = CartTotalsProvider._();

/// Cart totals against the live catalogue.

final class CartTotalsProvider
    extends
        $FunctionalProvider<
          ({
            int delivery,
            int savings,
            int subtotal,
            int? toFreeDelivery,
            int total,
          }),
          ({
            int delivery,
            int savings,
            int subtotal,
            int? toFreeDelivery,
            int total,
          }),
          ({
            int delivery,
            int savings,
            int subtotal,
            int? toFreeDelivery,
            int total,
          })
        >
    with
        $Provider<
          ({
            int delivery,
            int savings,
            int subtotal,
            int? toFreeDelivery,
            int total,
          })
        > {
  /// Cart totals against the live catalogue.
  CartTotalsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartTotalsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartTotalsHash();

  @$internal
  @override
  $ProviderElement<
    ({int delivery, int savings, int subtotal, int? toFreeDelivery, int total})
  >
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ({int delivery, int savings, int subtotal, int? toFreeDelivery, int total})
  create(Ref ref) {
    return cartTotals(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({int delivery, int savings, int subtotal, int? toFreeDelivery, int total})
    value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({
              int delivery,
              int savings,
              int subtotal,
              int? toFreeDelivery,
              int total,
            })
          >(value),
    );
  }
}

String _$cartTotalsHash() => r'd062a4b4423100d86d3b6a44d6e62ffbbd34077f';

/// Her orders, newest first.

@ProviderFor(OrdersController)
final ordersControllerProvider = OrdersControllerProvider._();

/// Her orders, newest first.
final class OrdersControllerProvider
    extends $NotifierProvider<OrdersController, List<Order>> {
  /// Her orders, newest first.
  OrdersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersControllerHash();

  @$internal
  @override
  OrdersController create() => OrdersController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Order> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Order>>(value),
    );
  }
}

String _$ordersControllerHash() => r'28713a431d71255a9cc5b6893b2bce023cabe955';

/// Her orders, newest first.

abstract class _$OrdersController extends $Notifier<List<Order>> {
  List<Order> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Order>, List<Order>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Order>, List<Order>>,
              List<Order>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(orderById)
final orderByIdProvider = OrderByIdFamily._();

final class OrderByIdProvider
    extends $FunctionalProvider<Order?, Order?, Order?>
    with $Provider<Order?> {
  OrderByIdProvider._({
    required OrderByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderByIdHash();

  @override
  String toString() {
    return r'orderByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Order?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Order? create(Ref ref) {
    final argument = this.argument as String;
    return orderById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Order? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Order?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is OrderByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderByIdHash() => r'bb924bdbc5d5b37c3fd01b2ed4f3e54da8b46562';

final class OrderByIdFamily extends $Family
    with $FunctionalFamilyOverride<Order?, String> {
  OrderByIdFamily._()
    : super(
        retry: null,
        name: r'orderByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderByIdProvider call(String id) =>
      OrderByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'orderByIdProvider';
}

/// Her subscription boxes.

@ProviderFor(SubscriptionsController)
final subscriptionsControllerProvider = SubscriptionsControllerProvider._();

/// Her subscription boxes.
final class SubscriptionsControllerProvider
    extends $NotifierProvider<SubscriptionsController, List<Subscription>> {
  /// Her subscription boxes.
  SubscriptionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionsControllerHash();

  @$internal
  @override
  SubscriptionsController create() => SubscriptionsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Subscription> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Subscription>>(value),
    );
  }
}

String _$subscriptionsControllerHash() =>
    r'e477ffc2679a31e6608567d929b1a87f15cc853b';

/// Her subscription boxes.

abstract class _$SubscriptionsController extends $Notifier<List<Subscription>> {
  List<Subscription> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Subscription>, List<Subscription>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Subscription>, List<Subscription>>,
              List<Subscription>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The active subscription for a product, if any.

@ProviderFor(subscriptionFor)
final subscriptionForProvider = SubscriptionForFamily._();

/// The active subscription for a product, if any.

final class SubscriptionForProvider
    extends $FunctionalProvider<Subscription?, Subscription?, Subscription?>
    with $Provider<Subscription?> {
  /// The active subscription for a product, if any.
  SubscriptionForProvider._({
    required SubscriptionForFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'subscriptionForProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subscriptionForHash();

  @override
  String toString() {
    return r'subscriptionForProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Subscription?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Subscription? create(Ref ref) {
    final argument = this.argument as String;
    return subscriptionFor(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Subscription? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Subscription?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubscriptionForProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subscriptionForHash() => r'2fcfdb0d196618c15526e153cb318ee1b1afea5d';

/// The active subscription for a product, if any.

final class SubscriptionForFamily extends $Family
    with $FunctionalFamilyOverride<Subscription?, String> {
  SubscriptionForFamily._()
    : super(
        retry: null,
        name: r'subscriptionForProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The active subscription for a product, if any.

  SubscriptionForProvider call(String productId) =>
      SubscriptionForProvider._(argument: productId, from: this);

  @override
  String toString() => r'subscriptionForProvider';
}
