import '../../../core/utils/date_utils.dart';
import '../../learn/domain/content_item.dart';
import '../../learn/domain/course.dart';
import '../../learn/domain/course_progress.dart';
import '../../learn/domain/daily_tip.dart';
import '../../profile/domain/personalization.dart';
import '../../profile/domain/user_profile.dart';
import '../../qa/domain/question.dart';
import '../../shop/domain/product.dart';
import '../../tracker/domain/cycle_timeline.dart';
import '../../tracker/domain/pregnancy_status.dart';
import '../../tracker/domain/tracker_enums.dart';
import 'home_feed.dart';

/// Everything the feed is built from.
typedef FeedSources = ({
  List<ContentItem> content,
  List<Course> courses,
  List<DailyTip> tips,
  List<Product> products,
  List<Question> questions,
  List<BabySize> babySizes,
  Map<String, CourseProgress> progress,
});

/// Builds the personalised home feed.
///
/// Pure and side-effect free, so the ranking rules can be unit-tested and
/// later swapped for a server-side recommender.
class FeedService {
  const FeedService();

  static const int forYouCount = 6;
  static const int offerCount = 4;
  static const int questionCount = 3;

  /// Period essentials appear this many days before the predicted period.
  static const int periodOfferLeadDays = 3;

  /// Pregnancy School items within this many weeks of her current week.
  static const int pregnancyWeekWindow = 2;

  HomeFeed build({
    required UserProfile? profile,
    required CycleTimeline timeline,
    required FeedSources sources,
    DateTime? now,
  }) {
    final date = (now ?? DateTime.now()).dateOnly;
    final pregnancy = _pregnancy(profile, date);
    final phase = timeline.phaseFor(date);

    final visible = [
      for (final item in sources.content)
        if (_isVisible(item, profile, pregnancy)) item,
    ];

    return HomeFeed(
      pregnancy: pregnancy,
      babySize: pregnancy == null
          ? null
          : PregnancyStatus.sizeFor(pregnancy.week, sources.babySizes),
      forYou: _rankContent(visible, profile, pregnancy),
      tip: _pickTip(sources.tips, profile, phase, date),
      continueCourse: _continueCourse(sources, visible, profile),
      offers: _offers(sources.products, profile, timeline, phase, date),
      offerReason: _offerReason(profile, timeline, phase, date),
      trendingQuestions: _trending(sources.questions, profile),
    );
  }

  PregnancyStatus? _pregnancy(UserProfile? profile, DateTime date) {
    if (profile?.lifeStage != LifeStage.pregnant) return null;
    final lmp = profile?.lastPeriodStart;
    return lmp == null ? null : PregnancyStatus.fromLastPeriod(lmp, date);
  }

  /// Age gating and pregnancy-week filtering.
  bool _isVisible(
    ContentItem item,
    UserProfile? profile,
    PregnancyStatus? pregnancy,
  ) {
    if (item.isAdultOnly && (profile?.ageGroup.isUnder16 ?? false)) {
      return false;
    }
    final week = item.pregnancyWeek;
    if (week == null) return true;
    // Week-by-week material only makes sense around her current week.
    if (pregnancy == null) return false;
    return (week - pregnancy.week).abs() <= pregnancyWeekWindow;
  }

  List<ContentItem> _rankContent(
    List<ContentItem> items,
    UserProfile? profile,
    PregnancyStatus? pregnancy,
  ) {
    final scored =
        [
          for (final item in items)
            (item, _contentScore(item, profile, pregnancy)),
        ]..sort((a, b) {
          final byScore = b.$2.compareTo(a.$2);
          if (byScore != 0) return byScore;
          // Popular items break ties, so the feed never looks arbitrary.
          return b.$1.viewCount.compareTo(a.$1.viewCount);
        });
    return [for (final entry in scored.take(forYouCount)) entry.$1];
  }

  int _contentScore(
    ContentItem item,
    UserProfile? profile,
    PregnancyStatus? pregnancy,
  ) {
    var score = 0;
    final stage = profile?.lifeStage;
    if (stage != null && item.stages.contains(stage)) score += 6;
    final interests = profile?.interests ?? const <Interest>[];
    score += 3 * item.interests.where(interests.contains).length;
    // A week-specific lesson at exactly the right week is the strongest
    // signal there is.
    if (pregnancy != null && item.pregnancyWeek != null) {
      score += 8 - (item.pregnancyWeek! - pregnancy.week).abs();
    }
    // Nudge towards free material so the feed is useful without premium.
    if (!item.isPremium) score += 1;
    return score;
  }

  /// One tip a day: the same tip for the whole day, rotating between days.
  DailyTip? _pickTip(
    List<DailyTip> tips,
    UserProfile? profile,
    CyclePhase phase,
    DateTime date,
  ) {
    if (tips.isEmpty) return null;
    final stage = profile?.lifeStage;
    final matching = [
      for (final tip in tips)
        if ((tip.phases.isEmpty || tip.phases.contains(phase)) &&
            (tip.stages.isEmpty ||
                (stage != null && tip.stages.contains(stage))))
          tip,
    ];
    final pool = matching.isEmpty ? tips : matching;
    // Stable within a day, different across days.
    final dayNumber = DateTime.utc(date.year, 1, 1).daysUntil(date);
    return pool[dayNumber % pool.length];
  }

  ContinueCourseCard? _continueCourse(
    FeedSources sources,
    List<ContentItem> visible,
    UserProfile? profile,
  ) {
    final courseEntries = [
      for (final item in visible)
        if (item.type == ContentType.course && item.courseId != null) item,
    ];
    if (courseEntries.isEmpty) return null;

    ContinueCourseCard? cardFor(ContentItem entry) {
      final course = sources.courses
          .where((course) => course.id == entry.courseId)
          .firstOrNull;
      if (course == null) return null;
      final progress = sources.progress[course.id];
      final next =
          progress?.nextLesson(course) ??
          (course.lessons.isEmpty ? null : course.lessons.first);
      if (next == null) return null;
      return ContinueCourseCard(
        course: course,
        content: entry,
        nextLesson: next,
        progress: progress,
      );
    }

    // An unfinished course she already started wins, newest activity first.
    final started = [
      for (final entry in courseEntries)
        if (cardFor(entry) case final card?)
          if (card.isStarted && !(card.progress?.isComplete ?? false)) card,
    ]..sort((a, b) => b.progress!.updatedAt.compareTo(a.progress!.updatedAt));
    if (started.isNotEmpty) return started.first;

    // Otherwise suggest the best-matching course she has not finished.
    final suggestions = [
      for (final entry in _rankContent(courseEntries, profile, null))
        if (cardFor(entry) case final card?)
          if (!(card.progress?.isComplete ?? false)) card,
    ];
    return suggestions.firstOrNull;
  }

  /// The shop row: timed to the cycle, then to her stage, then interests.
  List<Product> _offers(
    List<Product> products,
    UserProfile? profile,
    CycleTimeline timeline,
    CyclePhase phase,
    DateTime date,
  ) {
    final reason = _offerReason(profile, timeline, phase, date);
    final stage = profile?.lifeStage;
    final interests = profile?.interests ?? const <Interest>[];
    final underage = profile?.ageGroup.isUnder16 ?? false;

    final scored = <(Product, int)>[];
    for (final product in products) {
      if (underage && product.category.isAdultOnly) continue;
      var score = 0;
      switch (reason) {
        case OfferReason.periodSoon:
        case OfferReason.periodNow:
          if (product.category == ProductCategory.periodCare) score += 8;
          if (product.phases.contains(CyclePhase.period) ||
              product.phases.contains(CyclePhase.predictedPeriod)) {
            score += 6;
          }
        case OfferReason.fertileWindow:
          if (product.phases.contains(CyclePhase.fertile) ||
              product.phases.contains(CyclePhase.ovulation)) {
            score += 8;
          }
        case OfferReason.pregnancy:
          if (product.category == ProductCategory.pregnancy ||
              product.category == ProductCategory.baby) {
            score += 8;
          }
        case OfferReason.postpartum:
          if (product.category == ProductCategory.baby) score += 6;
        case OfferReason.menopause:
          if (product.stages.contains(LifeStage.menopause) ||
              product.stages.contains(LifeStage.perimenopause)) {
            score += 8;
          }
        case OfferReason.teen:
          if (product.category == ProductCategory.periodCare) score += 6;
        case OfferReason.general:
          break;
      }
      if (stage != null && product.stages.contains(stage)) score += 4;
      score += 2 * product.interests.where(interests.contains).length;
      if (product.phases.contains(phase)) score += 2;
      if (product.isDiscounted) score += 1;
      if (score > 0) scored.add((product, score));
    }

    scored.sort((a, b) {
      final byScore = b.$2.compareTo(a.$2);
      return byScore != 0 ? byScore : b.$1.rating.compareTo(a.$1.rating);
    });
    return [for (final entry in scored.take(offerCount)) entry.$1];
  }

  OfferReason _offerReason(
    UserProfile? profile,
    CycleTimeline timeline,
    CyclePhase phase,
    DateTime date,
  ) {
    switch (profile?.lifeStage) {
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
    if (phase == CyclePhase.period) return OfferReason.periodNow;
    final until = timeline.prediction?.daysUntilNextPeriod(date);
    if (until != null && until >= 0 && until <= periodOfferLeadDays) {
      return OfferReason.periodSoon;
    }
    if (profile?.lifeStage == LifeStage.tryingToConceive &&
        (phase == CyclePhase.fertile || phase == CyclePhase.ovulation)) {
      return OfferReason.fertileWindow;
    }
    if (profile?.ageGroup.isUnder16 ?? false) return OfferReason.teen;
    return OfferReason.general;
  }

  List<Question> _trending(List<Question> questions, UserProfile? profile) {
    final underage = profile?.ageGroup.isUnder16 ?? false;
    final relevant =
        [
          for (final question in questions)
            if (!(underage && question.category.isAdultOnly)) question,
        ]..sort((a, b) {
          // Answered questions first, then by upvotes.
          final byAnswered = (b.isAnswered ? 1 : 0).compareTo(
            a.isAnswered ? 1 : 0,
          );
          return byAnswered != 0 ? byAnswered : b.upvotes.compareTo(a.upvotes);
        });
    return relevant.take(questionCount).toList();
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
