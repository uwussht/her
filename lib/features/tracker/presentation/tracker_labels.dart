import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../domain/cycle_prediction.dart';
import '../domain/reminder.dart';
import '../domain/tracker_enums.dart';
import '../domain/reminder_scheduler.dart';
import '../domain/vaccination.dart';

extension FlowLevelLabel on FlowLevel {
  String label(AppLocalizations l10n) => switch (this) {
    FlowLevel.spotting => l10n.flowSpotting,
    FlowLevel.light => l10n.flowLight,
    FlowLevel.medium => l10n.flowMedium,
    FlowLevel.heavy => l10n.flowHeavy,
  };
}

extension MoodLabel on Mood {
  String label(AppLocalizations l10n) => switch (this) {
    Mood.great => l10n.moodGreat,
    Mood.good => l10n.moodGood,
    Mood.okay => l10n.moodOkay,
    Mood.low => l10n.moodLow,
    Mood.awful => l10n.moodAwful,
  };
}

extension EnergyLevelLabel on EnergyLevel {
  String label(AppLocalizations l10n) => switch (this) {
    EnergyLevel.low => l10n.energyLow,
    EnergyLevel.medium => l10n.energyMedium,
    EnergyLevel.high => l10n.energyHigh,
  };

  IconData get icon => switch (this) {
    EnergyLevel.low => Icons.battery_1_bar_rounded,
    EnergyLevel.medium => Icons.battery_4_bar_rounded,
    EnergyLevel.high => Icons.battery_full_rounded,
  };
}

extension SymptomLabel on Symptom {
  String label(AppLocalizations l10n) => switch (this) {
    Symptom.cramps => l10n.symptomCramps,
    Symptom.headache => l10n.symptomHeadache,
    Symptom.backPain => l10n.symptomBackPain,
    Symptom.bloating => l10n.symptomBloating,
    Symptom.breastTenderness => l10n.symptomBreastTenderness,
    Symptom.nausea => l10n.symptomNausea,
    Symptom.acne => l10n.symptomAcne,
    Symptom.fatigue => l10n.symptomFatigue,
    Symptom.cravings => l10n.symptomCravings,
    Symptom.insomnia => l10n.symptomInsomnia,
    Symptom.hotFlashes => l10n.symptomHotFlashes,
    Symptom.nightSweats => l10n.symptomNightSweats,
    Symptom.irritability => l10n.symptomIrritability,
    Symptom.anxiety => l10n.symptomAnxiety,
    Symptom.lowMood => l10n.symptomLowMood,
  };
}

extension SymptomGroupLabel on SymptomGroup {
  String label(AppLocalizations l10n) => switch (this) {
    SymptomGroup.physical => l10n.symptomGroupPhysical,
    SymptomGroup.emotional => l10n.symptomGroupEmotional,
    SymptomGroup.menopause => l10n.symptomGroupMenopause,
  };
}

extension PredictionConfidenceLabel on PredictionConfidence {
  String label(AppLocalizations l10n) => switch (this) {
    PredictionConfidence.estimated => l10n.confidenceEstimated,
    PredictionConfidence.low => l10n.confidenceLow,
    PredictionConfidence.medium => l10n.confidenceMedium,
    PredictionConfidence.high => l10n.confidenceHigh,
  };
}

extension ReminderTypeLabel on ReminderType {
  String label(AppLocalizations l10n) => switch (this) {
    ReminderType.periodComing => l10n.reminderTypePeriodComing,
    ReminderType.fertileWindow => l10n.reminderTypeFertileWindow,
    ReminderType.pill => l10n.reminderTypePill,
    ReminderType.water => l10n.reminderTypeWater,
    ReminderType.doctorVisit => l10n.reminderTypeDoctorVisit,
    ReminderType.vaccination => l10n.reminderTypeVaccination,
  };

  IconData get icon => switch (this) {
    ReminderType.periodComing => Icons.water_drop_rounded,
    ReminderType.fertileWindow => Icons.eco_rounded,
    ReminderType.pill => Icons.medication_rounded,
    ReminderType.water => Icons.local_drink_rounded,
    ReminderType.doctorVisit => Icons.medical_services_rounded,
    ReminderType.vaccination => Icons.vaccines_rounded,
  };
}

extension VaccineCodeLabel on VaccineCode {
  String label(AppLocalizations l10n) => switch (this) {
    VaccineCode.hpv => l10n.vaccineHpv,
    VaccineCode.flu => l10n.vaccineFlu,
    VaccineCode.tdap => l10n.vaccineTdap,
    VaccineCode.hepatitisB => l10n.vaccineHepatitisB,
    VaccineCode.measlesRubella => l10n.vaccineMeaslesRubella,
    VaccineCode.covid19 => l10n.vaccineCovid19,
    VaccineCode.tetanus => l10n.vaccineTetanus,
    VaccineCode.pneumococcal => l10n.vaccinePneumococcal,
    VaccineCode.shingles => l10n.vaccineShingles,
  };
}

extension VaccinationStatusLabel on VaccinationStatus {
  String label(AppLocalizations l10n) => switch (this) {
    VaccinationStatus.planned => l10n.vaccinationStatusPlanned,
    VaccinationStatus.done => l10n.vaccinationStatusDone,
    VaccinationStatus.skipped => l10n.vaccinationStatusSkipped,
  };
}

/// [ReminderTexts] filled from the ARB strings.
class L10nReminderTexts implements ReminderTexts {
  const L10nReminderTexts(this.l10n);

  final AppLocalizations l10n;

  @override
  ReminderText periodComing(int daysBefore) => (
    title: l10n.reminderPeriodComingTitle,
    body: l10n.reminderPeriodComingBody(daysBefore),
  );

  @override
  ReminderText fertileWindow() =>
      (title: l10n.reminderFertileTitle, body: l10n.reminderFertileBody);

  @override
  ReminderText pill() =>
      (title: l10n.reminderPillTitle, body: l10n.reminderPillBody);

  @override
  ReminderText water() =>
      (title: l10n.reminderWaterTitle, body: l10n.reminderWaterBody);

  @override
  ReminderText doctorVisit(String? label) => (
    title: label?.trim().isNotEmpty ?? false
        ? label!.trim()
        : l10n.reminderDoctorTitle,
    body: l10n.reminderDoctorBody,
  );

  @override
  ReminderText vaccination(VaccineCode code) => (
    title: l10n.reminderVaccinationTitle,
    body: l10n.reminderVaccinationBody(code.label(l10n)),
  );
}
