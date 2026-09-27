import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/app_env.dart';
import '../../../core/utils/date_utils.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../tracker/presentation/tracker_providers.dart';
import '../data/local_cart_repository.dart';
import '../data/local_order_repository.dart';
import '../data/local_subscription_repository.dart';
import '../data/mock_review_repository.dart';
import '../domain/cart.dart';
import '../domain/order.dart';
import '../domain/payment_service.dart';
import '../domain/product.dart';
import '../domain/product_recommender.dart';
import '../domain/review.dart';
import '../domain/shop_catalogue.dart';
import '../domain/subscription.dart';

part 'shop_providers.g.dart';

const _uuid = Uuid();

@Riverpod(keepAlive: true)
ShopCatalogue shopCatalogue(Ref ref) => const ShopCatalogue();

@Riverpod(keepAlive: true)
ProductRecommender productRecommender(Ref ref) => const ProductRecommender();

@Riverpod(keepAlive: true)
ReviewRepository reviewRepository(Ref ref) =>
    MockReviewRepository(ref.watch(mockAssetLoaderProvider));

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) => LocalCartRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) => LocalOrderRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

@Riverpod(keepAlive: true)
SubscriptionRepository subscriptionRepository(Ref ref) =>
    LocalSubscriptionRepository(
      ref.watch(localStoreProvider),
      ref.watch(currentUserProvider)?.uid ?? 'guest',
    );

/// The payment provider.
///
/// Kaspi Pay needs a merchant backend, so the mock runs until that exists.
/// Swap in [KaspiPaymentService] here once the endpoints are live.
@Riverpod(keepAlive: true)
PaymentService paymentService(Ref ref) =>
    AppEnv.useMocks ? const MockPaymentService() : const KaspiPaymentService();

@Riverpod(keepAlive: true)
Future<List<Review>> reviews(Ref ref) =>
    ref.watch(reviewRepositoryProvider).fetchReviews();

/// Products keyed by id, for pricing the cart.
@riverpod
Map<String, Product> productsById(Ref ref) {
  final products = ref.watch(productsProvider).value ?? const [];
  return {for (final product in products) product.id: product};
}

/// Sellers whose products carry the "local brand" badge.
@riverpod
Set<String> localSellerIds(Ref ref) {
  final sellers = ref.watch(sellersProvider).value ?? const [];
  return {
    for (final seller in sellers)
      if (seller.isLocalBrand) seller.id,
  };
}

@riverpod
List<Review> reviewsForProduct(Ref ref, String productId) {
  final all = ref.watch(reviewsProvider).value ?? const [];
  final result = [
    for (final review in all)
      if (review.productId == productId) review,
  ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return result;
}

/// The shop's filters.
@riverpod
class ShopFilterController extends _$ShopFilterController {
  @override
  ShopFilter build() => const ShopFilter();

  void setCategory(ProductCategory? category) => state = state.copyWith(
    category: category,
    clearCategory: category == null,
  );

  void setQuery(String query) => state = state.copyWith(query: query);

  void setSort(ShopSort sort) => state = state.copyWith(sort: sort);

  void setMaxPrice(int? price) =>
      state = state.copyWith(maxPrice: price, clearMaxPrice: price == null);

  void toggleLocalBrands() =>
      state = state.copyWith(localBrandsOnly: !state.localBrandsOnly);

  void toggleDiscounted() =>
      state = state.copyWith(discountedOnly: !state.discountedOnly);

  void clear() => state = const ShopFilter();
}

/// The filtered, sorted shop list.
@riverpod
List<Product> shopResults(Ref ref) {
  final profile = ref.watch(userProfileControllerProvider);
  return ref
      .watch(shopCatalogueProvider)
      .apply(
        products: ref.watch(productsProvider).value ?? const [],
        filter: ref.watch(shopFilterControllerProvider),
        ageGroup: profile?.ageGroup,
        lifeStage: profile?.lifeStage,
        interests: profile?.interests ?? const [],
        localSellerIds: ref.watch(localSellerIdsProvider),
      );
}

@riverpod
List<ProductCategory> shopCategories(Ref ref) => ref
    .watch(shopCatalogueProvider)
    .categoriesFor(ref.watch(userProfileControllerProvider)?.ageGroup);

/// Why the "for you" row shows what it shows.
@riverpod
OfferReason shopOfferReason(Ref ref) {
  final profile = ref.watch(userProfileControllerProvider);
  return ref
      .watch(productRecommenderProvider)
      .reasonFor(
        ageGroup: profile?.ageGroup,
        lifeStage: profile?.lifeStage,
        timeline: ref.watch(cycleTimelineProvider),
        on: today(),
      );
}

/// Products recommended from the tracker forecast and her life stage.
@riverpod
List<Product> recommendedProducts(Ref ref) {
  final profile = ref.watch(userProfileControllerProvider);
  final timeline = ref.watch(cycleTimelineProvider);
  return ref
      .watch(productRecommenderProvider)
      .recommend(
        products: ref.watch(productsProvider).value ?? const [],
        reason: ref.watch(shopOfferReasonProvider),
        ageGroup: profile?.ageGroup,
        lifeStage: profile?.lifeStage,
        interests: profile?.interests ?? const [],
        phase: timeline.phaseFor(today()),
        limit: 6,
      );
}

@riverpod
Product? productById(Ref ref, String id) => ref.watch(productsByIdProvider)[id];

/// Her cart.
@Riverpod(keepAlive: true)
class CartController extends _$CartController {
  @override
  Cart build() => ref.watch(cartRepositoryProvider).read();

  Future<void> _write(Cart cart) async {
    state = cart;
    await ref.read(cartRepositoryProvider).save(cart);
  }

  Future<void> add(String productId, {int quantity = 1}) =>
      _write(state.add(productId, quantity: quantity));

  Future<void> setQuantity(String productId, int quantity) =>
      _write(state.setQuantity(productId, quantity));

  Future<void> remove(String productId) => _write(state.remove(productId));

  Future<void> clear() => _write(const Cart());
}

/// Cart totals against the live catalogue.
@riverpod
({int subtotal, int delivery, int total, int savings, int? toFreeDelivery})
cartTotals(Ref ref) {
  final cart = ref.watch(cartControllerProvider);
  final catalogue = ref.watch(productsByIdProvider);
  return (
    subtotal: cart.subtotal(catalogue),
    delivery: cart.delivery(catalogue),
    total: cart.total(catalogue),
    savings: cart.savings(catalogue),
    toFreeDelivery: cart.amountToFreeDelivery(catalogue),
  );
}

/// Her orders, newest first.
@Riverpod(keepAlive: true)
class OrdersController extends _$OrdersController {
  @override
  List<Order> build() => ref.watch(orderRepositoryProvider).readAll();

  Future<void> add(Order order) async {
    await ref.read(orderRepositoryProvider).save(order);
    state = ref.read(orderRepositoryProvider).readAll();
  }
}

@riverpod
Order? orderById(Ref ref, String id) {
  for (final order in ref.watch(ordersControllerProvider)) {
    if (order.id == id) return order;
  }
  return null;
}

/// Her subscription boxes.
@Riverpod(keepAlive: true)
class SubscriptionsController extends _$SubscriptionsController {
  @override
  List<Subscription> build() =>
      ref.watch(subscriptionRepositoryProvider).readAll();

  /// Signs her up for [product], timing the first box to her forecast.
  Future<Subscription> subscribe({
    required Product product,
    required BoxCadence cadence,
  }) async {
    final prediction = ref.read(cyclePredictionProvider);
    final first = const SubscriptionScheduler().firstDelivery(
      cadence: cadence,
      from: today(),
      nextPeriodStart: prediction?.nextPeriodStart,
    );
    final subscription = Subscription(
      id: 'sub.${_uuid.v4()}',
      productId: product.id,
      cadence: cadence,
      startedAt: today(),
      nextDelivery: first,
    );
    await ref.read(subscriptionRepositoryProvider).save(subscription);
    state = ref.read(subscriptionRepositoryProvider).readAll();
    return subscription;
  }

  Future<void> cancel(String id) async {
    await ref.read(subscriptionRepositoryProvider).cancel(id);
    state = ref.read(subscriptionRepositoryProvider).readAll();
  }
}

/// The active subscription for a product, if any.
@riverpod
Subscription? subscriptionFor(Ref ref, String productId) {
  for (final subscription in ref.watch(subscriptionsControllerProvider)) {
    if (subscription.productId == productId && subscription.active) {
      return subscription;
    }
  }
  return null;
}
