/// Whether she has premium, and where that came from.
enum PremiumStatus {
  free,

  /// 7-day free trial.
  trial,
  active;

  bool get hasAccess => this != PremiumStatus.free;
}
