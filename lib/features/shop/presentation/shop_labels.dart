import '../../../core/l10n/l10n.dart';
import '../domain/order.dart';
import '../domain/payment_service.dart';
import '../domain/product_recommender.dart';
import '../domain/shop_catalogue.dart';
import '../domain/subscription.dart';

extension ShopSortLabel on ShopSort {
  String label(AppLocalizations l10n) => switch (this) {
    ShopSort.recommended => l10n.shopSortRecommended,
    ShopSort.priceAsc => l10n.shopSortPriceAsc,
    ShopSort.priceDesc => l10n.shopSortPriceDesc,
    ShopSort.rating => l10n.shopSortRating,
    ShopSort.newest => l10n.shopSortNewest,
  };
}

extension OfferReasonLabel on OfferReason {
  String label(AppLocalizations l10n) => switch (this) {
    OfferReason.periodSoon => l10n.offerHeadingPeriodSoon,
    OfferReason.periodNow => l10n.offerHeadingPeriodNow,
    OfferReason.fertileWindow => l10n.offerHeadingFertile,
    OfferReason.pregnancy => l10n.offerHeadingPregnancy,
    OfferReason.postpartum => l10n.offerHeadingPostpartum,
    OfferReason.menopause => l10n.offerHeadingMenopause,
    OfferReason.teen => l10n.offerHeadingTeen,
    OfferReason.general => l10n.shopForYou,
  };
}

extension PaymentMethodLabel on PaymentMethod {
  String label(AppLocalizations l10n) => switch (this) {
    PaymentMethod.kaspi => l10n.paymentKaspi,
    PaymentMethod.card => l10n.paymentCard,
    PaymentMethod.cashOnDelivery => l10n.paymentCash,
  };

  String note(AppLocalizations l10n) => switch (this) {
    PaymentMethod.kaspi => l10n.paymentKaspiNote,
    PaymentMethod.card => l10n.paymentCardNote,
    PaymentMethod.cashOnDelivery => l10n.paymentCashNote,
  };
}

extension OrderStatusLabel on OrderStatus {
  String label(AppLocalizations l10n) => switch (this) {
    OrderStatus.placed => l10n.orderStatusPlaced,
    OrderStatus.packing => l10n.orderStatusPacking,
    OrderStatus.shipped => l10n.orderStatusShipped,
    OrderStatus.delivered => l10n.orderStatusDelivered,
    OrderStatus.cancelled => l10n.orderStatusCancelled,
  };
}

extension BoxCadenceLabel on BoxCadence {
  String label(AppLocalizations l10n) => switch (this) {
    BoxCadence.monthly => l10n.boxCadenceMonthly,
    BoxCadence.trimester => l10n.boxCadenceTrimester,
  };
}

String paymentFailureMessage(
  AppLocalizations l10n,
  PaymentFailureReason reason,
) {
  return switch (reason) {
    PaymentFailureReason.declined => l10n.paymentErrorDeclined,
    PaymentFailureReason.insufficientFunds => l10n.paymentErrorFunds,
    PaymentFailureReason.invalidCard => l10n.paymentErrorInvalidCard,
    PaymentFailureReason.network => l10n.paymentErrorNetwork,
    PaymentFailureReason.cancelled => l10n.paymentErrorCancelled,
    PaymentFailureReason.notImplemented => l10n.paymentErrorNotImplemented,
  };
}
