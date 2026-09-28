import 'dart:ui' show Locale;

import '../../../core/services/mock_asset_loader.dart';
import '../domain/ai_service.dart';
import '../domain/emergency_detector.dart';
import 'ai_answer.dart';
import 'answer_matcher.dart';

/// The assistant, answered from `assets/mock/ai_answers.json`.
///
/// Runs until the FastAPI proxy is deployed. It keeps the same contract as
/// [HttpAiService], including the emergency flag, so swapping them changes
/// nothing above the data layer.
class MockAiService implements AiService {
  const MockAiService(
    this._loader, {
    this.latency = const Duration(milliseconds: 700),
    this.matcher = const AnswerMatcher(),
    this.detector = const EmergencyDetector(),
  });

  final MockAssetLoader _loader;

  /// Stands in for the round trip, so the typing indicator is exercised.
  final Duration latency;
  final AnswerMatcher matcher;
  final EmergencyDetector detector;

  Future<List<AiAnswer>> _answers() async => [
    for (final json in await _loader.loadList('ai_answers'))
      AiAnswer.fromJson(json),
  ];

  @override
  Future<AiChatResponse> chat(AiChatRequest request) async {
    final answers = await _answers();
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    final answer = matcher.match(request.message, answers);
    final locale = Locale(request.userContext.language);
    return AiChatResponse(
      reply: answer?.answer.resolve(locale) ?? '',
      references: answer?.references ?? const [],
      emergency: detector.isEmergency(request.message),
    );
  }
}
