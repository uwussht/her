/// Age bands asked in the personalization quiz.
enum AgeGroup {
  age10to15,
  age16to24,
  age25to34,
  age35to44,
  age45plus;

  /// Under 16: offered Moms & Daughters linking and kept away from 18+
  /// content.
  bool get isUnder16 => this == AgeGroup.age10to15;

  /// Life stages that make sense for this age band, in display order.
  List<LifeStage> get lifeStages => switch (this) {
    AgeGroup.age10to15 => const [
      LifeStage.firstPeriod,
      LifeStage.trackingCycle,
    ],
    AgeGroup.age16to24 || AgeGroup.age25to34 => const [
      LifeStage.trackingCycle,
      LifeStage.tryingToConceive,
      LifeStage.pregnant,
      LifeStage.postpartum,
      LifeStage.firstPeriod,
    ],
    AgeGroup.age35to44 => const [
      LifeStage.trackingCycle,
      LifeStage.tryingToConceive,
      LifeStage.pregnant,
      LifeStage.postpartum,
      LifeStage.perimenopause,
    ],
    AgeGroup.age45plus => const [
      LifeStage.perimenopause,
      LifeStage.menopause,
      LifeStage.trackingCycle,
      LifeStage.pregnant,
      LifeStage.postpartum,
    ],
  };
}

/// Where she is in life. Drives the tracker mode, feed and shop offers.
enum LifeStage {
  firstPeriod,
  trackingCycle,
  tryingToConceive,
  pregnant,
  postpartum,
  perimenopause,
  menopause;

  /// The last-period question is framed around pregnancy dating.
  bool get isPregnancy => this == LifeStage.pregnant;

  /// Whether the quiz asks for an average cycle length. Not asked when
  /// periods are paused or have stopped.
  bool get asksCycleLength => switch (this) {
    LifeStage.firstPeriod ||
    LifeStage.trackingCycle ||
    LifeStage.tryingToConceive ||
    LifeStage.perimenopause => true,
    LifeStage.pregnant || LifeStage.postpartum || LifeStage.menopause => false,
  };

  /// How far back the last-period date picker goes.
  Duration get lastPeriodLookback => switch (this) {
    // Up to 42 weeks of pregnancy.
    LifeStage.pregnant => const Duration(days: 42 * 7),
    LifeStage.menopause => const Duration(days: 5 * 365),
    _ => const Duration(days: 365),
  };

  /// Interests pre-selected in the quiz for this stage.
  Set<Interest> get suggestedInterests => switch (this) {
    LifeStage.firstPeriod => {Interest.myBody, Interest.cycleHealth},
    LifeStage.trackingCycle => {Interest.cycleHealth},
    LifeStage.tryingToConceive => {Interest.fertility},
    LifeStage.pregnant => {Interest.pregnancy},
    LifeStage.postpartum => {Interest.babyAndMotherhood},
    LifeStage.perimenopause || LifeStage.menopause => {Interest.menopause},
  };
}

/// Topics picked in the quiz. Used to personalise the feed.
enum Interest {
  myBody,
  cycleHealth,
  fertility,
  pregnancy,
  babyAndMotherhood,
  menopause,
  mentalHealth,
  nutrition,
  fitness,
  beauty,
  intimacy;

  /// 18+ topic, hidden from under-16 users.
  bool get isAdult => this == Interest.intimacy;

  static List<Interest> availableFor(AgeGroup? ageGroup) => [
    for (final interest in Interest.values)
      if (!(interest.isAdult && (ageGroup?.isUnder16 ?? false))) interest,
  ];
}
