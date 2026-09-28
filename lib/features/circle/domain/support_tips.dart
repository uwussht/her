import '../../profile/domain/personalization.dart';
import '../../tracker/domain/tracker_enums.dart';

/// "How to support her today" (spec 5.7).
///
/// The wording lives in the ARB files; this only decides which tip fits the
/// day. Deliberately practical and free of instructions about her body.
enum SupportTip {
  periodComfort,
  periodPatience,
  follicularPlans,
  fertileHonesty,
  lutealCalm,
  pregnancyChores,
  pregnancyAppointments,
  postpartumNight,
  postpartumAsk,
  menopauseCool,
  lowMoodListen,
  greatMoodCelebrate,
  general;

  /// The tip for her day.
  ///
  /// A low mood outranks the cycle phase: if she is having a bad day, that is
  /// the more useful thing to tell him.
  static SupportTip forDay({
    CyclePhase? phase,
    Mood? mood,
    LifeStage? stage,
    int? pregnancyWeek,
  }) {
    if (mood != null && mood.score <= Mood.low.score) {
      return SupportTip.lowMoodListen;
    }
    final stageTip = switch (stage) {
      LifeStage.pregnant =>
        pregnancyWeek != null && pregnancyWeek >= 28
            ? SupportTip.pregnancyChores
            : SupportTip.pregnancyAppointments,
      LifeStage.postpartum => SupportTip.postpartumNight,
      LifeStage.perimenopause ||
      LifeStage.menopause => SupportTip.menopauseCool,
      _ => null,
    };
    if (stageTip != null) return stageTip;

    final phaseTip = switch (phase) {
      CyclePhase.period ||
      CyclePhase.predictedPeriod => SupportTip.periodComfort,
      CyclePhase.follicular => SupportTip.follicularPlans,
      CyclePhase.fertile || CyclePhase.ovulation => SupportTip.fertileHonesty,
      CyclePhase.luteal => SupportTip.lutealCalm,
      CyclePhase.unknown || null => null,
    };
    if (phaseTip != null) return phaseTip;

    if (mood == Mood.great) return SupportTip.greatMoodCelebrate;
    return SupportTip.general;
  }
}
