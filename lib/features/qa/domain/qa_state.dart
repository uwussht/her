import 'package:flutter/foundation.dart';

import 'question.dart';

/// How the Q&A list is ordered.
enum QaSort { top, newest, unanswered }

/// Questions she asked and answers she upvoted, kept on device until the
/// backend exists.
@immutable
class QaLocalState {
  const QaLocalState({
    this.myQuestions = const [],
    this.upvotedQuestionIds = const {},
  });

  final List<Question> myQuestions;
  final Set<String> upvotedQuestionIds;

  QaLocalState copyWith({
    List<Question>? myQuestions,
    Set<String>? upvotedQuestionIds,
  }) {
    return QaLocalState(
      myQuestions: myQuestions ?? this.myQuestions,
      upvotedQuestionIds: upvotedQuestionIds ?? this.upvotedQuestionIds,
    );
  }
}

/// Sorts and filters the Q&A list. Pure, so the ordering is unit-tested.
class QaCatalogue {
  const QaCatalogue();

  /// Minimum length of a question, so answers have something to work with.
  static const int minQuestionLength = 15;

  List<Question> apply({
    required List<Question> questions,
    QaSort sort = QaSort.top,
    Object? category,
    bool hideAdultOnly = false,
    Set<String> upvoted = const {},
  }) {
    final result = [
      for (final question in questions)
        if (!(hideAdultOnly && question.category.isAdultOnly))
          if (category == null || question.category == category)
            // Her own upvote is reflected immediately.
            if (upvoted.contains(question.id))
              question.copyWith(upvotes: question.upvotes + 1)
            else
              question,
    ];

    result.sort(
      (a, b) => switch (sort) {
        QaSort.newest => b.askedAt.compareTo(a.askedAt),
        QaSort.unanswered => _unansweredFirst(a, b),
        QaSort.top => _topFirst(a, b),
      },
    );
    return result;
  }

  /// Answered first, then most upvoted.
  static int _topFirst(Question a, Question b) {
    final byAnswered = (b.isAnswered ? 1 : 0).compareTo(a.isAnswered ? 1 : 0);
    if (byAnswered != 0) return byAnswered;
    return b.upvotes.compareTo(a.upvotes);
  }

  static int _unansweredFirst(Question a, Question b) {
    final byAnswered = (a.isAnswered ? 1 : 0).compareTo(b.isAnswered ? 1 : 0);
    if (byAnswered != 0) return byAnswered;
    return b.askedAt.compareTo(a.askedAt);
  }
}
