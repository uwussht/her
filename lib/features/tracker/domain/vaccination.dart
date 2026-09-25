import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/personalization.dart';

part 'vaccination.freezed.dart';
part 'vaccination.g.dart';

/// Vaccines the app can suggest. Kazakhstan's national calendar plus the
/// common adult and pregnancy ones.
enum VaccineCode {
  hpv,
  flu,
  tdap,
  hepatitisB,
  measlesRubella,
  covid19,
  tetanus,
  pneumococcal,
  shingles,
}

enum VaccinationStatus { planned, done, skipped }

/// A suggested or scheduled vaccination. Fully editable: she can retime it,
/// mark it done or drop it.
@freezed
abstract class Vaccination with _$Vaccination {
  const factory Vaccination({
    required String id,
    required VaccineCode code,
    required DateTime dueDate,
    @Default(VaccinationStatus.planned) VaccinationStatus status,

    /// False once she has edited or added it by hand, so the schedule stops
    /// overwriting it.
    @Default(true) bool suggested,
    String? notes,
  }) = _Vaccination;

  const Vaccination._();

  factory Vaccination.fromJson(Map<String, dynamic> json) =>
      _$VaccinationFromJson(json);

  bool get isOpen => status == VaccinationStatus.planned;
}

/// Age- and stage-based suggestions. Informational only: it never claims to
/// be a medical schedule, and every entry can be edited.
class VaccinationSchedule {
  const VaccinationSchedule();

  /// Vaccines worth surfacing for [ageGroup] and [lifeStage].
  List<VaccineCode> suggestionsFor({
    required AgeGroup ageGroup,
    required LifeStage lifeStage,
  }) {
    final codes = <VaccineCode>{VaccineCode.flu};

    switch (ageGroup) {
      case AgeGroup.age10to15:
        codes.addAll([VaccineCode.hpv, VaccineCode.hepatitisB]);
      case AgeGroup.age16to24:
        codes.addAll([VaccineCode.hpv, VaccineCode.measlesRubella]);
      case AgeGroup.age25to34:
        codes.addAll([VaccineCode.measlesRubella, VaccineCode.tetanus]);
      case AgeGroup.age35to44:
        codes.add(VaccineCode.tetanus);
      case AgeGroup.age45plus:
        codes.addAll([VaccineCode.shingles, VaccineCode.pneumococcal]);
    }

    switch (lifeStage) {
      case LifeStage.pregnant:
        // Tdap in every pregnancy protects the newborn from whooping cough.
        codes.addAll([VaccineCode.tdap, VaccineCode.covid19]);
        codes.remove(
          VaccineCode.measlesRubella,
        ); // Live vaccine: not in pregnancy.
        codes.remove(VaccineCode.hpv);
      case LifeStage.tryingToConceive:
        codes.add(VaccineCode.measlesRubella);
      case LifeStage.postpartum:
        codes.add(VaccineCode.tdap);
      case LifeStage.firstPeriod:
      case LifeStage.trackingCycle:
      case LifeStage.perimenopause:
      case LifeStage.menopause:
        break;
    }
    return codes.toList();
  }

  /// First-time due dates: soon, but not today, so the list does not open
  /// already overdue.
  DateTime defaultDueDate(VaccineCode code, DateTime from) => switch (code) {
    // Seasonal: aim for the next autumn campaign.
    VaccineCode.flu => _nextAutumn(from),
    // Best given between weeks 27 and 36, so a couple of months out.
    VaccineCode.tdap => DateTime(from.year, from.month + 2, from.day),
    _ => DateTime(from.year, from.month + 1, from.day),
  };

  static DateTime _nextAutumn(DateTime from) {
    final thisYear = DateTime(from.year, 10, 1);
    return from.isBefore(thisYear) ? thisYear : DateTime(from.year + 1, 10, 1);
  }
}
