import '../../profile/domain/personalization.dart';
import '../../tracker/domain/cycle_timeline.dart';
import '../../tracker/domain/tracker_enums.dart';
import 'product.dart';

/// Why a set of products is being shown. Drives the row heading on the home
/// feed and the "for you" row in the shop.
enum OfferReason {
  periodSoon,
  periodNow,
  fertileWindow,
  pregnancy,
  postpartum,
  menopause,
  teen,
  general,
}

/// Picks products from the tracker forecast and her life stage.
///
/// Shared by the home feed and the shop, and pure so the timing rules are
/// unit-tested in one place.
class ProductRecommender {
  const ProductRecommender();

  /// Period essentials appear this many days before the predicted period.
  static const int periodOfferLeadDays = 3;

  OfferReason reasonFor({
    required AgeGroup? ageGroup,
    required LifeStage? lifeStage,
    required CycleTimeline timeline,
    required DateTime on,
  }) {
    switch (lifeStage) {
      case LifeStage.pregnant:
        return OfferReason.pregnancy;
      case LifeStage.postpartum:
        return OfferReason.postpartum;
      case LifeStage.menopause:
      case LifeStage.perimenopause:
        return OfferReason.menopause;
      case _:
        break;
    }

    if (timeline.phaseFor(on) == CyclePhase.period) {
      return OfferReason.periodNow;
    }
    final until = timeline.prediction?.daysUntilNextPeriod(on);
    if (until != null && until >= 0 && until <= periodOfferLeadDays) {
      return OfferReason.periodSoon;
    }
    final phase = timeline.phaseFor(on);
    if (lifeStage == LifeStage.tryingToConceive &&
        (phase == CyclePhase.fertile || phase == CyclePhase.ovulation)) {
      return OfferReason.fertileWindow;
    }
    if (ageGroup?.isUnder16 ?? false) return OfferReason.teen;
    return OfferReason.general;
  }

  /// Ranks [products] for [reason], her stage and her interests.
  ///
  /// Products scoring nothing are left out, so an empty list means "nothing
  /// worth showing" rather than "show anything".
  List<Product> recommend({
    required List<Product> products,
    required OfferReason reason,
    AgeGroup? ageGroup,
    LifeStage? lifeStage,
    List<Interest> interests = const [],
    CyclePhase phase = CyclePhase.unknown,
    int limit = 4,
    Set<String> excludeIds = const {},
  }) {
    final underage = ageGroup?.isUnder16 ?? false;
    final scored = <(Product, int)>[];

    for (final product in products) {
      if (excludeIds.contains(product.id)) continue;
      if (underage && product.category.isAdultOnly) continue;
      if (!product.inStock) continue;

      var score = _reasonScore(product, reason);
      if (lifeStage != null && product.stages.contains(lifeStage)) score += 4;
      score += 2 * product.interests.where(interests.contains).length;
      if (product.phases.contains(phase)) score += 2;
      if (product.isDiscounted) score += 1;
      if (score > 0) scored.add((product, score));
    }

    scored.sort((a, b) {
      final byScore = b.$2.compareTo(a.$2);
      return byScore != 0 ? byScore : b.$1.rating.compareTo(a.$1.rating);
    });
    return [for (final entry in scored.take(limit)) entry.$1];
  }

  static int _reasonScore(Product product, OfferReason reason) {
    switch (reason) {
      case OfferReason.periodSoon:
      case OfferReason.periodNow:
        var score = 0;
        if (product.category == ProductCategory.periodCare) score += 8;
        if (product.phases.contains(CyclePhase.period) ||
            product.phases.contains(CyclePhase.predictedPeriod)) {
          score += 6;
        }
        return score;
      case OfferReason.fertileWindow:
        return product.phases.contains(CyclePhase.fertile) ||
                product.phases.contains(CyclePhase.ovulation)
            ? 8
            : 0;
      case OfferReason.pregnancy:
        return product.category == ProductCategory.pregnancy ||
                product.category == ProductCategory.baby
            ? 8
            : 0;
      case OfferReason.postpartum:
        return product.category == ProductCategory.baby ? 6 : 0;
      case OfferReason.menopause:
        return product.stages.contains(LifeStage.menopause) ||
                product.stages.contains(LifeStage.perimenopause)
            ? 8
            : 0;
      case OfferReason.teen:
        return product.category == ProductCategory.periodCare ? 6 : 0;
      case OfferReason.general:
        return 0;
    }
  }
}
