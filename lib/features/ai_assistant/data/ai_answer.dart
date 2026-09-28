import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';
import '../domain/chat_message.dart';

part 'ai_answer.freezed.dart';
part 'ai_answer.g.dart';

/// One canned answer from `assets/mock/ai_answers.json`.
///
/// The real backend composes answers from the same library, so the app side
/// of the conversation looks identical whichever service is wired in.
@freezed
abstract class AiAnswer with _$AiAnswer {
  const factory AiAnswer({
    required String id,

    /// Phrases that select this answer, per language.
    ///
    /// Stored as stems (lowercase, trailing vowels and soft signs trimmed:
    /// `желез`, not `железо`), because they are matched as substrings and
    /// Russian and Kazakh inflect the ending of almost every word.
    @Default(<String, List<String>>{}) Map<String, List<String>> keywords,
    @LocalizedTextConverter() required LocalizedText answer,
    @Default(<ChatReference>[]) List<ChatReference> references,
  }) = _AiAnswer;

  const AiAnswer._();

  factory AiAnswer.fromJson(Map<String, dynamic> json) =>
      _$AiAnswerFromJson(json);

  /// The id of the answer used when nothing matches.
  static const String fallbackId = 'fallback';

  /// Every keyword, in every language, so a Russian question still matches an
  /// English phrase she typed.
  Iterable<String> get allKeywords =>
      keywords.values.expand((phrases) => phrases);

  /// How well [text] (already lowercased) matches this answer.
  ///
  /// Longer phrases count for more, so "болит живот" beats a bare "боль".
  int scoreFor(String text) {
    var score = 0;
    for (final keyword in allKeywords) {
      if (text.contains(keyword.toLowerCase())) score += keyword.length;
    }
    return score;
  }
}
