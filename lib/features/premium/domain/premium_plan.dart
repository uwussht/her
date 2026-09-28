/// The two ways to pay (spec 5.9).
///
/// Prices are in tenge and live here rather than in the UI, so the paywall,
/// the receipt and the tests all quote the same number.
enum PremiumPlan {
  monthly(priceTenge: 2490, months: 1),
  yearly(priceTenge: 19900, months: 12);

  const PremiumPlan({required this.priceTenge, required this.months});

  final int priceTenge;

  /// How much access one payment buys.
  final int months;

  /// Free trial before the first charge.
  static const int trialDays = 7;

  static PremiumPlan get recommended => PremiumPlan.yearly;

  /// Equivalent monthly price, rounded to the tenge, for the "≈ X ₸ a month"
  /// line under the yearly plan.
  int get pricePerMonthTenge => (priceTenge / months).round();

  /// Percent saved against paying monthly for the same period, 0 when there
  /// is nothing to save.
  int get savingsPercent {
    final monthly = PremiumPlan.monthly.priceTenge * months;
    if (monthly <= priceTenge) return 0;
    return ((monthly - priceTenge) / monthly * 100).round();
  }
}
