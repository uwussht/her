import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// One scheduled local notification.
@immutable
class ScheduledNotification {
  const ScheduledNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.when,
    this.channel = NotificationChannel.reminders,
    this.repeatsDaily = false,
    this.payload,
  });

  final int id;
  final String title;
  final String body;
  final DateTime when;
  final NotificationChannel channel;

  /// Repeats at the same clock time every day.
  final bool repeatsDaily;
  final String? payload;
}

/// Notification channels, so Android lets her mute one kind without losing
/// the rest.
enum NotificationChannel {
  reminders('reminders'),

  /// Body text is hidden on the lock screen when "hide app content" is on.
  sensitive('sensitive');

  const NotificationChannel(this.id);

  final String id;
}

/// Schedules local reminders. Kept behind an interface so tests and the
/// reminder logic never touch the platform plugin.
abstract interface class NotificationService {
  Future<void> initialize();

  /// Asks for the Android 13+ notification permission. Returns false when
  /// she declines.
  Future<bool> requestPermission();

  /// Replaces every notification in [channel] with [notifications].
  Future<void> reschedule({required List<ScheduledNotification> notifications});

  Future<void> cancelAll();
}

/// Ignores everything. Used in tests and before permission is granted.
class NoopNotificationService implements NotificationService {
  const NoopNotificationService();

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> requestPermission() async => false;

  @override
  Future<void> reschedule({
    required List<ScheduledNotification> notifications,
  }) async {}

  @override
  Future<void> cancelAll() async {}
}

/// [NotificationService] on top of flutter_local_notifications.
class LocalNotificationService implements NotificationService {
  LocalNotificationService({
    FlutterLocalNotificationsPlugin? plugin,
    this.hideContent = false,
  }) : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

  /// "Hide app content" mode: notifications show a neutral title and no
  /// details, so a glance at the lock screen reveals nothing.
  final bool hideContent;

  bool _initialized = false;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    tz_data.initializeTimeZones();
    final timezone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezone.identifier));
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
    );
    _initialized = true;
  }

  @override
  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await android?.requestNotificationsPermission() ?? false;
  }

  @override
  Future<void> reschedule({
    required List<ScheduledNotification> notifications,
  }) async {
    await initialize();
    await _plugin.cancelAll();
    for (final notification in notifications) {
      await _schedule(notification);
    }
  }

  @override
  Future<void> cancelAll() async {
    await initialize();
    await _plugin.cancelAll();
  }

  Future<void> _schedule(ScheduledNotification notification) async {
    final when = tz.TZDateTime.from(notification.when, tz.local);
    if (when.isBefore(tz.TZDateTime.now(tz.local)) &&
        !notification.repeatsDaily) {
      return;
    }
    await _plugin.zonedSchedule(
      id: notification.id,
      title: hideContent ? _hiddenTitle : notification.title,
      body: hideContent ? '' : notification.body,
      scheduledDate: when,
      payload: notification.payload,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: notification.repeatsDaily
          ? DateTimeComponents.time
          : null,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          notification.channel.id,
          notification.channel.id,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          visibility: hideContent
              ? NotificationVisibility.secret
              : NotificationVisibility.private,
        ),
      ),
    );
  }

  /// Neutral text for hidden mode. Not localized on purpose: it must give
  /// nothing away, and the app name alone is enough.
  static const String _hiddenTitle = 'Her Circle';
}
