import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';

part 'expert.freezed.dart';
part 'expert.g.dart';

/// A doctor or specialist who answers questions and presents lessons.
@freezed
abstract class Expert with _$Expert {
  const factory Expert({
    required String id,
    required String name,
    @LocalizedTextConverter() required LocalizedText specialty,

    /// Credentials checked by the Her Circle team: shows the verified badge.
    @Default(true) bool verified,
    String? photoUrl,
    String? city,
    int? yearsOfPractice,
  }) = _Expert;

  factory Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);
}
