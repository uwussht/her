// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vaccination _$VaccinationFromJson(Map<String, dynamic> json) => _Vaccination(
  id: json['id'] as String,
  code: $enumDecode(_$VaccineCodeEnumMap, json['code']),
  dueDate: DateTime.parse(json['dueDate'] as String),
  status:
      $enumDecodeNullable(_$VaccinationStatusEnumMap, json['status']) ??
      VaccinationStatus.planned,
  suggested: json['suggested'] as bool? ?? true,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$VaccinationToJson(_Vaccination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': _$VaccineCodeEnumMap[instance.code]!,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': _$VaccinationStatusEnumMap[instance.status]!,
      'suggested': instance.suggested,
      'notes': instance.notes,
    };

const _$VaccineCodeEnumMap = {
  VaccineCode.hpv: 'hpv',
  VaccineCode.flu: 'flu',
  VaccineCode.tdap: 'tdap',
  VaccineCode.hepatitisB: 'hepatitisB',
  VaccineCode.measlesRubella: 'measlesRubella',
  VaccineCode.covid19: 'covid19',
  VaccineCode.tetanus: 'tetanus',
  VaccineCode.pneumococcal: 'pneumococcal',
  VaccineCode.shingles: 'shingles',
};

const _$VaccinationStatusEnumMap = {
  VaccinationStatus.planned: 'planned',
  VaccinationStatus.done: 'done',
  VaccinationStatus.skipped: 'skipped',
};
