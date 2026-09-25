import 'package:flutter/foundation.dart';

import '../../learn/domain/content_item.dart';
import '../../learn/domain/course.dart';
import '../../learn/domain/course_progress.dart';
import '../../learn/domain/daily_tip.dart';
import '../../qa/domain/question.dart';
import '../../shop/domain/product.dart';
import '../../tracker/domain/pregnancy_status.dart';

/// Why the shop row is showing what it is showing. Drives its heading.
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

/// A course she can pick up, with the lesson to open next.
@immutable
class ContinueCourseCard {
  const ContinueCourseCard({
    required this.course,
    required this.content,
    required this.nextLesson,
    required this.progress,
  });

  final Course course;

  /// The library entry, for the title and premium badge.
  final ContentItem content;
  final Lesson nextLesson;

  /// Null when she has not started the course yet.
  final CourseProgress? progress;

  double get fraction => progress?.fractionOf(course) ?? 0;

  bool get isStarted => progress?.isStarted ?? false;
}

/// Everything the home tab renders, already personalised and ordered.
@immutable
class HomeFeed {
  const HomeFeed({
    this.pregnancy,
    this.babySize,
    this.forYou = const [],
    this.tip,
    this.continueCourse,
    this.offers = const [],
    this.offerReason = OfferReason.general,
    this.trendingQuestions = const [],
  });

  /// Set when she is pregnant and we can date the pregnancy.
  final PregnancyStatus? pregnancy;
  final BabySize? babySize;

  final List<ContentItem> forYou;
  final DailyTip? tip;
  final ContinueCourseCard? continueCourse;
  final List<Product> offers;
  final OfferReason offerReason;
  final List<Question> trendingQuestions;

  bool get isEmpty =>
      forYou.isEmpty &&
      tip == null &&
      continueCourse == null &&
      offers.isEmpty &&
      trendingQuestions.isEmpty;
}
