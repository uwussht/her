import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

enum ChatRole { user, assistant }

/// Something the answer points at inside the app.
enum ReferenceKind { lesson, product }

@freezed
abstract class ChatReference with _$ChatReference {
  const factory ChatReference({
    required ReferenceKind kind,
    required String id,
  }) = _ChatReference;

  factory ChatReference.fromJson(Map<String, dynamic> json) =>
      _$ChatReferenceFromJson(json);
}

/// One message in the Circle AI conversation.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required ChatRole role,
    required String text,
    required DateTime sentAt,

    /// Lessons and products the answer links to.
    @Default(<ChatReference>[]) List<ChatReference> references,

    /// An urgent-care answer: shown with the emergency card instead of the
    /// usual bubble.
    @Default(false) bool isEmergency,

    /// The request failed; the bubble offers a retry.
    @Default(false) bool isError,
  }) = _ChatMessage;

  const ChatMessage._();

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  bool get isUser => role == ChatRole.user;
}
