import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/personalization.dart';
import '../../profile/domain/user_profile.dart';
import '../../tracker/domain/cycle_timeline.dart';
import '../../tracker/domain/pregnancy_status.dart';

part 'ai_context.freezed.dart';
part 'ai_context.g.dart';

/// What the assistant is told about her, so answers fit where she is.
///
/// Deliberately minimal: an age band and a stage rather than a birth date, a
/// cycle day rather than her log. Nothing here identifies her.
@freezed
abstract class AiUserContext with _$AiUserContext {
  const factory AiUserContext({
    String? ageGroup,
    String? stage,

    /// Day of her current cycle, 1-based.
    int? cycleDay,

    /// Week of pregnancy, when that is her stage.
    int? pregWeek,
    required String language,
  }) = _AiUserContext;

  const AiUserContext._();

  factory AiUserContext.fromJson(Map<String, dynamic> json) =>
      _$AiUserContextFromJson(json);

  /// Builds the context from her profile and tracker.
  factory AiUserContext.from({
    required UserProfile? profile,
    required CycleTimeline timeline,
    required String language,
    DateTime? now,
  }) {
    final date = now ?? DateTime.now();
    final isPregnant = profile?.lifeStage == LifeStage.pregnant;
    final lmp = profile?.lastPeriodStart;
    return AiUserContext(
      ageGroup: profile?.ageGroup.wireName,
      stage: profile?.lifeStage.name,
      cycleDay: isPregnant ? null : timeline.cycleDayFor(date),
      pregWeek: isPregnant && lmp != null
          ? PregnancyStatus.fromLastPeriod(lmp, date)?.week
          : null,
      language: language,
    );
  }
}

extension AgeGroupWireName on AgeGroup {
  /// Stable wire value, e.g. `25-34`, so the backend never has to know the
  /// app's enum names.
  String get wireName => switch (this) {
    AgeGroup.age10to15 => '10-15',
    AgeGroup.age16to24 => '16-24',
    AgeGroup.age25to34 => '25-34',
    AgeGroup.age35to44 => '35-44',
    AgeGroup.age45plus => '45+',
  };
}
