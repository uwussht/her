import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_utils.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

/// How often a box is delivered.
enum BoxCadence {
  /// Once per cycle, timed to arrive before her period.
  monthly,

  /// Once per trimester.
  trimester;

  int get deliveryCount => switch (this) {
    BoxCadence.monthly => 12,
    BoxCadence.trimester => 3,
  };
}

/// A subscription box she has signed up for.
@freezed
abstract class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required String productId,
    required BoxCadence cadence,
    required DateTime startedAt,
    required DateTime nextDelivery,
    @Default(true) bool active,
    @Default(0) int deliveriesMade,
  }) = _Subscription;

  const Subscription._();

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  /// Days before the predicted period that a monthly box should land.
  static const int monthlyLeadDays = 3;
  static const int trimesterDays = 90;

  /// The next few delivery dates, for the schedule on the product page.
  List<DateTime> upcoming({int count = 3, int? cycleLength}) {
    final gap = switch (cadence) {
      BoxCadence.monthly => cycleLength ?? 28,
      BoxCadence.trimester => trimesterDays,
    };
    return [for (var i = 0; i < count; i++) nextDelivery.addDays(gap * i)];
  }
}

/// Works out when boxes should arrive.
///
/// Pure, so the timing rules are unit-tested.
class SubscriptionScheduler {
  const SubscriptionScheduler();

  /// A monthly box lands [Subscription.monthlyLeadDays] before the predicted
  /// period. Falls back to a month out when there is no forecast yet.
  DateTime firstDelivery({
    required BoxCadence cadence,
    required DateTime from,
    DateTime? nextPeriodStart,
  }) {
    switch (cadence) {
      case BoxCadence.monthly:
        if (nextPeriodStart == null) return from.addDays(30);
        final target = nextPeriodStart.addDays(-Subscription.monthlyLeadDays);
        // If that date has passed, aim at the cycle after it.
        return target.isAfter(from) ? target : from.addDays(7);
      case BoxCadence.trimester:
        // The first trimester box ships straight away.
        return from.addDays(2);
    }
  }
}

abstract interface class SubscriptionRepository {
  List<Subscription> readAll();

  Future<void> save(Subscription subscription);

  Future<void> cancel(String id);
}
