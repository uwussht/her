import 'chat_message.dart';

/// The conversation, kept on device.
///
/// Health questions are sensitive, so the history lives in the encrypted
/// local store and is never uploaded.
abstract interface class ChatRepository {
  List<ChatMessage> read();

  Future<void> save(List<ChatMessage> messages);

  Future<void> clear();
}
