import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/ai_quota.dart';
import '../domain/chat_message.dart';
import '../domain/chat_repository.dart';

/// The conversation, in the encrypted on-device store.
///
/// Her questions are health data, so nothing here is synced.
class LocalChatRepository implements ChatRepository {
  const LocalChatRepository(this._store, this._uid, {this.maxMessages = 100});

  final LocalStore _store;
  final String _uid;

  /// Older messages are dropped, so the box cannot grow without bound.
  final int maxMessages;

  String get _key => 'ai.chat.$_uid';

  @override
  List<ChatMessage> read() {
    final items =
        _store.readJson(_key)?['messages'] as List<dynamic>? ?? const [];
    return [
      for (final item in items)
        ChatMessage.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> save(List<ChatMessage> messages) {
    final trimmed = messages.length <= maxMessages
        ? messages
        : messages.sublist(messages.length - maxMessages);
    return _store.writeJson(_key, {
      'messages': [for (final message in trimmed) message.toJson()],
    });
  }

  @override
  Future<void> clear() => _store.delete(_key);
}

/// Today's message count, in the same store.
class LocalAiUsageRepository implements AiUsageRepository {
  const LocalAiUsageRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'ai.usage.$_uid';

  @override
  AiUsage read() {
    final json = _store.readJson(_key);
    if (json == null) return AiUsage(day: DateTime.now().dateOnly);
    return AiUsage.fromJson(json);
  }

  @override
  Future<void> save(AiUsage usage) => _store.writeJson(_key, usage.toJson());
}
