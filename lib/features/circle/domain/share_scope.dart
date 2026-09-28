/// What she lets the other person see.
///
/// Nothing is shared without a switch being on, and every switch is separate,
/// because "he knows my cycle phase" and "he reads my symptoms" are not the
/// same decision. The support tips obey these too: a tip is only chosen from
/// a signal she shares, so a scope that is off cannot leak through the advice.
enum ShareScope {
  /// Her life stage, and tips based on it.
  lifeStage,

  /// Cycle day and phase, e.g. "Day 12 · Fertile window".
  cyclePhase,

  /// Today's mood, on the emoji scale.
  mood,

  /// Pregnancy week, the due date and the countdown.
  pregnancy,

  /// The symptoms she logged today.
  symptoms;

  /// What a new partner link starts with: enough for the support tips to be
  /// useful, and nothing she has to explain.
  static const Set<ShareScope> partnerDefaults = {
    ShareScope.lifeStage,
    ShareScope.cyclePhase,
    ShareScope.mood,
  };

  /// A daughter shares nothing until she chooses to (spec 5.8).
  static const Set<ShareScope> familyDefaults = <ShareScope>{};
}
