import '../../profile/domain/personalization.dart';
import '../../profile/domain/user_profile.dart';
import '../../tracker/domain/cycle_timeline.dart';
import '../../tracker/domain/pregnancy_status.dart';
import '../../tracker/domain/tracker_enums.dart';
import 'share_scope.dart';
import 'support_tips.dart';

/// Everything the other person is allowed to see, and nothing else.
class PartnerSummary {
  const PartnerSummary({
    required this.tip,
    this.stage,
    this.cycleDay,
    this.phase,
    this.mood,
    this.symptoms = const [],
    this.pregnancyWeek,
    this.dueDate,
    this.daysToDue,
  });

  final LifeStage? stage;
  final int? cycleDay;
  final CyclePhase? phase;
  final Mood? mood;
  final List<Symptom> symptoms;
  final int? pregnancyWeek;
  final DateTime? dueDate;
  final int? daysToDue;

  /// The support tip, always present: with every scope off he is still told
  /// something useful, just nothing about her.
  final SupportTip tip;

  /// True when she shares nothing at all, so the screen can say so plainly.
  bool get isEmpty =>
      stage == null &&
      cycleDay == null &&
      phase == null &&
      mood == null &&
      symptoms.isEmpty &&
      pregnancyWeek == null;
}

/// Builds the partner's view from her data and her switches.
///
/// Pure, and the single place that decides what crosses a link. A scope that
/// is off leaves no trace in the result — not in a field, not in the tip.
class PartnerSummaryService {
  const PartnerSummaryService();

  PartnerSummary build({
    required Set<ShareScope> shares,
    required UserProfile? profile,
    required CycleTimeline timeline,
    Mood? mood,
    List<Symptom> symptoms = const [],
    DateTime? now,
  }) {
    final date = now ?? DateTime.now();
    final stage = profile?.lifeStage;
    final isPregnant = stage == LifeStage.pregnant;
    final lmp = profile?.lastPeriodStart;

    final sharesStage = shares.contains(ShareScope.lifeStage);
    final sharesCycle = shares.contains(ShareScope.cyclePhase) && !isPregnant;
    final sharesMood = shares.contains(ShareScope.mood);
    final sharesPregnancy = shares.contains(ShareScope.pregnancy) && isPregnant;

    final pregnancy = sharesPregnancy && lmp != null
        ? PregnancyStatus.fromLastPeriod(lmp, date)
        : null;
    final phase = sharesCycle ? timeline.phaseFor(date) : null;
    final sharedMood = sharesMood ? mood : null;

    return PartnerSummary(
      stage: sharesStage ? stage : null,
      cycleDay: sharesCycle ? timeline.cycleDayFor(date) : null,
      phase: phase == CyclePhase.unknown ? null : phase,
      mood: sharedMood,
      symptoms: shares.contains(ShareScope.symptoms) ? symptoms : const [],
      pregnancyWeek: pregnancy?.week,
      dueDate: pregnancy?.dueDate,
      daysToDue: pregnancy?.daysRemaining,
      tip: SupportTip.forDay(
        phase: phase,
        mood: sharedMood,
        stage: sharesStage ? stage : null,
        pregnancyWeek: pregnancy?.week,
      ),
    );
  }
}
