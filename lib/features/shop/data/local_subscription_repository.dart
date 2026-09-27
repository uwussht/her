import '../../../core/services/storage/local_store.dart';
import '../domain/subscription.dart';

class LocalSubscriptionRepository implements SubscriptionRepository {
  const LocalSubscriptionRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'shop.subscriptions.$_uid';

  @override
  List<Subscription> readAll() {
    final items = _store.readJson(_key)?['items'] as List<dynamic>? ?? const [];
    return [
      for (final item in items)
        Subscription.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> save(Subscription subscription) async {
    final all = readAll()
      ..removeWhere((existing) => existing.id == subscription.id)
      ..add(subscription);
    await _write(all);
  }

  @override
  Future<void> cancel(String id) async {
    final all = [
      for (final item in readAll())
        if (item.id == id) item.copyWith(active: false) else item,
    ];
    await _write(all);
  }

  Future<void> _write(List<Subscription> all) => _store.writeJson(_key, {
    'items': [for (final item in all) item.toJson()],
  });
}
