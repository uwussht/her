import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';
import '../../profile/domain/personalization.dart';

part 'content_item.freezed.dart';
part 'content_item.g.dart';

/// Learn library sections.
enum ContentCategory {
  myBody,
  cycleHealth,
  pregnancySchool,
  postpartum,
  menopause,
  mentalHealth,
  nutrition,
  intimacy;

  /// 18+ section, hidden from minors and gated behind a confirmation.
  bool get isAdultOnly => this == ContentCategory.intimacy;
}

enum ContentType { video, article, course, podcast }

/// Free or premium. Premium items show a badge and open the paywall.
enum AccessTier { free, premium }

/// One item in the Learn library or the home feed.
@freezed
abstract class ContentItem with _$ContentItem {
  const factory ContentItem({
    required String id,
    required ContentType type,
    required ContentCategory category,
    @LocalizedTextConverter() required LocalizedText title,
    @LocalizedTextConverter() required LocalizedText summary,

    /// Article body, one entry per paragraph. Empty for videos and courses.
    @Default(<LocalizedText>[])
    @LocalizedTextListConverter()
    List<LocalizedText> body,
    @Default(AccessTier.free) AccessTier tier,

    /// Reading or watching time, in minutes.
    required int durationMinutes,

    /// Life stages this is written for. Empty means it suits everyone.
    @Default(<LifeStage>[]) List<LifeStage> stages,
    @Default(<Interest>[]) List<Interest> interests,

    /// Pregnancy School items are pinned to a week of pregnancy.
    int? pregnancyWeek,

    /// Set for [ContentType.course]; points at the course's modules.
    String? courseId,

    /// Verified expert who wrote or presented it.
    String? expertId,
    String? imageUrl,
    String? videoUrl,
    @Default(0) int viewCount,
    DateTime? publishedAt,
  }) = _ContentItem;

  const ContentItem._();

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);

  bool get isPremium => tier == AccessTier.premium;

  bool get isAdultOnly => category.isAdultOnly;

  bool get hasBody => body.isNotEmpty;

  /// Whether it can be opened in the video player.
  bool get isPlayable =>
      (type == ContentType.video || type == ContentType.podcast) &&
      videoUrl != null;
}
