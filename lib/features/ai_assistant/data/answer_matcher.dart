import 'ai_answer.dart';

/// Picks the answer that best fits a question.
///
/// Pure and unit-tested: this is the part of the mock assistant that decides
/// what she is told, so it must not depend on I/O or on the clock.
class AnswerMatcher {
  const AnswerMatcher();

  /// The best match for [message], or the fallback answer.
  ///
  /// Returns null only when [answers] has neither a match nor a fallback.
  AiAnswer? match(String message, List<AiAnswer> answers) {
    final text = message.toLowerCase();
    AiAnswer? best;
    var bestScore = 0;
    for (final answer in answers) {
      if (answer.id == AiAnswer.fallbackId) continue;
      final score = answer.scoreFor(text);
      if (score > bestScore) {
        best = answer;
        bestScore = score;
      }
    }
    if (best != null) return best;
    for (final answer in answers) {
      if (answer.id == AiAnswer.fallbackId) return answer;
    }
    return answers.isEmpty ? null : answers.last;
  }
}
