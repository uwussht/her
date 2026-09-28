import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../domain/ai_service.dart';
import '../domain/chat_message.dart';
import 'ai_providers.dart';

part 'chat_controller.g.dart';

const _uuid = Uuid();

/// The conversation on screen.
@immutable
class ChatState {
  const ChatState({
    this.messages = const [],
    this.isSending = false,
    this.limitReached = false,
  });

  final List<ChatMessage> messages;

  /// A request is in flight; the typing bubble is showing.
  final bool isSending;

  /// She tried to send after using up the free tier today.
  final bool limitReached;

  bool get isEmpty => messages.isEmpty;

  /// The last thing she asked, for the retry button.
  ChatMessage? get lastQuestion {
    for (final message in messages.reversed) {
      if (message.isUser) return message;
    }
    return null;
  }

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isSending,
    bool? limitReached,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
      limitReached: limitReached ?? this.limitReached,
    );
  }
}

/// Drives Circle AI: quota, emergency screening, the request, the history.
///
/// The order matters. An emergency phrase is caught on the device and never
/// sent anywhere: she gets the urgent-care card immediately, even offline,
/// and it costs her nothing from the free tier.
@Riverpod(keepAlive: true)
class ChatController extends _$ChatController {
  @override
  ChatState build() =>
      ChatState(messages: ref.watch(chatRepositoryProvider).read());

  /// Sends [text]. Returns false when the daily limit stopped it.
  Future<bool> send(String text) async {
    final message = text.trim();
    if (message.isEmpty || state.isSending) return true;

    if (!ref.read(canSendAiMessageProvider)) {
      state = state.copyWith(limitReached: true);
      return false;
    }

    final asked = ChatMessage(
      id: _uuid.v4(),
      role: ChatRole.user,
      text: message,
      sentAt: DateTime.now(),
    );
    await _append(asked);

    if (ref.read(emergencyDetectorProvider).isEmergency(message)) {
      await _append(_assistant(text: '', isEmergency: true));
      return true;
    }

    await _ask(message);
    return true;
  }

  /// Sends her last question again after a failed request.
  Future<void> retry() async {
    final question = state.lastQuestion;
    if (question == null || state.isSending) return;
    final messages = [...state.messages];
    while (messages.isNotEmpty && !messages.last.isUser) {
      messages.removeLast();
    }
    state = state.copyWith(messages: messages);
    await _write(messages);
    await _ask(question.text);
  }

  Future<void> clear() async {
    state = const ChatState();
    await ref.read(chatRepositoryProvider).clear();
  }

  /// Hides the limit notice once she has seen it.
  void dismissLimit() => state = state.copyWith(limitReached: false);

  Future<void> _ask(String message) async {
    state = state.copyWith(isSending: true);
    final request = AiChatRequest(
      message: message,
      userContext: ref.read(aiUserContextProvider),
    );
    try {
      final response = await ref.read(aiServiceProvider).chat(request);
      state = state.copyWith(isSending: false);
      await _append(
        _assistant(
          text: response.reply,
          references: response.references,
          isEmergency: response.emergency,
        ),
      );
      // Only a delivered answer is charged against the free tier.
      await ref.read(aiUsageControllerProvider.notifier).increment();
    } on AiFailure catch (_) {
      state = state.copyWith(isSending: false);
      await _append(_assistant(text: '', isError: true));
    }
  }

  ChatMessage _assistant({
    required String text,
    List<ChatReference> references = const [],
    bool isEmergency = false,
    bool isError = false,
  }) {
    return ChatMessage(
      id: _uuid.v4(),
      role: ChatRole.assistant,
      text: text,
      sentAt: DateTime.now(),
      references: references,
      isEmergency: isEmergency,
      isError: isError,
    );
  }

  Future<void> _append(ChatMessage message) async {
    final messages = [...state.messages, message];
    state = state.copyWith(messages: messages, limitReached: false);
    await _write(messages);
  }

  Future<void> _write(List<ChatMessage> messages) =>
      ref.read(chatRepositoryProvider).save(messages);
}
