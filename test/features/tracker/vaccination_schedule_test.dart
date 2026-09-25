import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/tracker/domain/vaccination.dart';

void main() {
  const schedule = VaccinationSchedule();

  List<VaccineCode> suggestions(AgeGroup age, LifeStage stage) =>
      schedule.suggestionsFor(ageGroup: age, lifeStage: stage);

  test('teens are offered HPV', () {
    expect(
      suggestions(AgeGroup.age10to15, LifeStage.firstPeriod),
      contains(VaccineCode.hpv),
    );
  });

  test('pregnancy adds Tdap and drops live vaccines', () {
    final pregnant = suggestions(AgeGroup.age25to34, LifeStage.pregnant);
    expect(pregnant, contains(VaccineCode.tdap));
    expect(pregnant, isNot(contains(VaccineCode.measlesRubella)));
    expect(pregnant, isNot(contains(VaccineCode.hpv)));
  });

  test('trying to conceive is offered measles and rubella', () {
    expect(
      suggestions(AgeGroup.age25to34, LifeStage.tryingToConceive),
      contains(VaccineCode.measlesRubella),
    );
  });

  test('older users are offered shingles and pneumococcal', () {
    expect(
      suggestions(AgeGroup.age45plus, LifeStage.menopause),
      containsAll([VaccineCode.shingles, VaccineCode.pneumococcal]),
    );
  });

  test('flu is suggested for everyone', () {
    for (final age in AgeGroup.values) {
      for (final stage in age.lifeStages) {
        expect(suggestions(age, stage), contains(VaccineCode.flu));
      }
    }
  });

  test('flu is timed for the next autumn campaign', () {
    expect(
      schedule.defaultDueDate(VaccineCode.flu, DateTime(2026, 3, 15)),
      DateTime(2026, 10, 1),
    );
    // Already past October: aim for next year.
    expect(
      schedule.defaultDueDate(VaccineCode.flu, DateTime(2026, 11, 20)),
      DateTime(2027, 10, 1),
    );
  });

  test('other vaccines default to a month out, never today', () {
    final from = DateTime(2026, 9, 10);
    final due = schedule.defaultDueDate(VaccineCode.hpv, from);
    expect(due.isAfter(from), isTrue);
    expect(due, DateTime(2026, 10, 10));
  });
}
