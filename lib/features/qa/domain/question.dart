import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';
import '../../learn/domain/content_item.dart';

part 'question.freezed.dart';
part 'question.g.dart';

/// An expert's reply to a question.
@freezed
abstract class Answer with _$Answer {
  const factory Answer({
    required String id,
    required String questionId,
    required String expertId,
    @LocalizedTextConverter() required LocalizedText body,
    required DateTime answeredAt,
    @Default(0) int upvotes,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

/// A question in the expert Q&A. Questions can be asked anonymously.
@freezed
abstract class Question with _$Question {
  const factory Question({
    required String id,
    @LocalizedTextConverter() required LocalizedText body,
    required ContentCategory category,
    required DateTime askedAt,

    /// Display name of the asker, or null when asked anonymously.
    String? askedBy,
    @Default(0) int upvotes,
    @Default(<Answer>[]) List<Answer> answers,

    /// Premium askers are answered first.
    @Default(false) bool priority,
  }) = _Question;

  const Question._();

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  bool get isAnonymous => askedBy == null;

  bool get isAnswered => answers.isNotEmpty;

  Answer? get topAnswer {
    if (answers.isEmpty) return null;
    return answers.reduce((a, b) => a.upvotes >= b.upvotes ? a : b);
  }
}
