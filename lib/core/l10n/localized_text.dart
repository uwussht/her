import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_locales.dart';

/// A string that exists in each supported language.
///
/// Content lives in the database (mock JSON for now), so it cannot come from
/// the ARB files. It is stored as `{"ru": "...", "kk": "...", "en": "..."}`,
/// the same shape Firestore will hold.
@immutable
class LocalizedText {
  const LocalizedText(this.values);

  factory LocalizedText.fromJson(Map<String, dynamic> json) => LocalizedText({
    for (final entry in json.entries) entry.key: entry.value as String,
  });

  final Map<String, String> values;

  Map<String, dynamic> toJson() => values;

  /// Text in [locale], falling back to Russian and then to any language
  /// present, so a half-translated item still renders.
  String resolve(Locale locale) {
    return values[locale.languageCode] ??
        values[AppLocale.fallback.locale.languageCode] ??
        (values.isEmpty ? '' : values.values.first);
  }

  String of(BuildContext context) => resolve(Localizations.localeOf(context));

  @override
  bool operator ==(Object other) =>
      other is LocalizedText && mapEquals(values, other.values);

  @override
  int get hashCode => Object.hashAllUnordered(
    values.entries.map((entry) => Object.hash(entry.key, entry.value)),
  );

  @override
  String toString() => 'LocalizedText(${values.keys.join(',')})';
}

/// Lets freezed models hold a [LocalizedText] field.
class LocalizedTextConverter
    implements JsonConverter<LocalizedText, Map<String, dynamic>> {
  const LocalizedTextConverter();

  @override
  LocalizedText fromJson(Map<String, dynamic> json) =>
      LocalizedText.fromJson(json);

  @override
  Map<String, dynamic> toJson(LocalizedText object) => object.toJson();
}

/// Lets freezed models hold a list of [LocalizedText], e.g. an article body.
class LocalizedTextListConverter
    implements JsonConverter<List<LocalizedText>, List<dynamic>> {
  const LocalizedTextListConverter();

  @override
  List<LocalizedText> fromJson(List<dynamic> json) => [
    for (final item in json)
      LocalizedText.fromJson(item as Map<String, dynamic>),
  ];

  @override
  List<dynamic> toJson(List<LocalizedText> object) => [
    for (final item in object) item.toJson(),
  ];
}
