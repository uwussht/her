/// Bleeding intensity for a logged day.
enum FlowLevel {
  spotting,
  light,
  medium,
  heavy;

  /// Days with real bleeding count towards period length.
  bool get isBleeding => this != FlowLevel.spotting;
}

/// Symptoms she can log. Grouped so the log sheet can section them.
enum Symptom {
  cramps(SymptomGroup.physical),
  headache(SymptomGroup.physical),
  backPain(SymptomGroup.physical),
  bloating(SymptomGroup.physical),
  breastTenderness(SymptomGroup.physical),
  nausea(SymptomGroup.physical),
  acne(SymptomGroup.physical),
  fatigue(SymptomGroup.physical),
  cravings(SymptomGroup.physical),
  insomnia(SymptomGroup.physical),
  hotFlashes(SymptomGroup.menopause),
  nightSweats(SymptomGroup.menopause),
  irritability(SymptomGroup.emotional),
  anxiety(SymptomGroup.emotional),
  lowMood(SymptomGroup.emotional);

  const Symptom(this.group);

  final SymptomGroup group;
}

enum SymptomGroup { physical, emotional, menopause }

/// Mood on a 5-point emoji scale.
enum Mood {
  great(5),
  good(4),
  okay(3),
  low(2),
  awful(1);

  const Mood(this.score);

  /// 1 (awful) to 5 (great). Used by the mood charts.
  final int score;

  String get emoji => switch (this) {
    Mood.great => '😄',
    Mood.good => '🙂',
    Mood.okay => '😐',
    Mood.low => '😕',
    Mood.awful => '😢',
  };
}

/// Energy level on a 3-point scale.
enum EnergyLevel { low, medium, high }

/// Where a day sits in the cycle. Drives the calendar colours: pink for
/// period, green for fertile and ovulation.
enum CyclePhase {
  period,
  predictedPeriod,
  follicular,
  fertile,
  ovulation,
  luteal,

  /// Not enough data to say.
  unknown,
}
