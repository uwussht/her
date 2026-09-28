import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_context.dart';
import 'chat_message.dart';

part 'ai_service.freezed.dart';
part 'ai_service.g.dart';

/// The body of `POST /ai/chat`.
@freezed
abstract class AiChatRequest with _$AiChatRequest {
  const factory AiChatRequest({
    required String message,
    required AiUserContext userContext,
  }) = _AiChatRequest;

  factory AiChatRequest.fromJson(Map<String, dynamic> json) =>
      _$AiChatRequestFromJson(json);
}

/// The reply from `POST /ai/chat`.
@freezed
abstract class AiChatResponse with _$AiChatResponse {
  const factory AiChatResponse({
    required String reply,
    @Default(<ChatReference>[]) List<ChatReference> references,

    /// The backend recognised an emergency and wants the urgent-care card
    /// shown. The app also detects this on its own, before sending.
    @Default(false) bool emergency,
  }) = _AiChatResponse;

  factory AiChatResponse.fromJson(Map<String, dynamic> json) =>
      _$AiChatResponseFromJson(json);
}

/// Why a request failed.
enum AiFailureReason { network, timeout, server, rateLimited, unknown }

class AiFailure implements Exception {
  const AiFailure(this.reason, [this.debugMessage]);

  final AiFailureReason reason;
  final String? debugMessage;

  @override
  String toString() => 'AiFailure($reason)';
}

/// The assistant backend.
///
/// The app never holds a model provider's key: requests go to our own
/// FastAPI proxy, which adds the key and the system prompt server-side.
abstract interface class AiService {
  Future<AiChatResponse> chat(AiChatRequest request);
}
