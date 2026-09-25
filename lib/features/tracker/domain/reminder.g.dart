// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderTime _$ReminderTimeFromJson(Map<String, dynamic> json) =>
    _ReminderTime(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
    );

Map<String, dynamic> _$ReminderTimeToJson(_ReminderTime instance) =>
    <String, dynamic>{'hour': instance.hour, 'minute': instance.minute};

_Reminder _$ReminderFromJson(Map<String, dynamic> json) => _Reminder(
  id: json['id'] as String,
  type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
  time: ReminderTime.fromJson(json['time'] as Map<String, dynamic>),
  enabled: json['enabled'] as bool? ?? true,
  daysBefore: (json['daysBefore'] as num?)?.toInt() ?? 3,
  timesPerDay: (json['timesPerDay'] as num?)?.toInt() ?? 4,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  label: json['label'] as String?,
  vaccinationId: json['vaccinationId'] as String?,
);

Map<String, dynamic> _$ReminderToJson(_Reminder instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$ReminderTypeEnumMap[instance.type]!,
  'time': instance.time.toJson(),
  'enabled': instance.enabled,
  'daysBefore': instance.daysBefore,
  'timesPerDay': instance.timesPerDay,
  'date': instance.date?.toIso8601String(),
  'label': instance.label,
  'vaccinationId': instance.vaccinationId,
};

const _$ReminderTypeEnumMap = {
  ReminderType.periodComing: 'periodComing',
  ReminderType.fertileWindow: 'fertileWindow',
  ReminderType.pill: 'pill',
  ReminderType.water: 'water',
  ReminderType.doctorVisit: 'doctorVisit',
  ReminderType.vaccination: 'vaccination',
};
