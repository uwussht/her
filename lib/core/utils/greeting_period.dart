/// Part of the day, used for the home greeting.
enum GreetingPeriod {
  morning,
  afternoon,
  evening;

  static GreetingPeriod fromHour(int hour) {
    if (hour >= 5 && hour < 12) return GreetingPeriod.morning;
    if (hour >= 12 && hour < 18) return GreetingPeriod.afternoon;
    return GreetingPeriod.evening;
  }
}
