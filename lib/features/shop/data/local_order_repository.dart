import '../../../core/services/storage/local_store.dart';
import '../domain/order.dart';

/// Orders and the last delivery address, kept on device.
///
/// Replaced by Firestore writes once the backend exists; the interface does
/// not change.
class LocalOrderRepository implements OrderRepository {
  const LocalOrderRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _ordersKey => 'shop.orders.$_uid';
  String get _addressKey => 'shop.address.$_uid';

  @override
  List<Order> readAll() {
    final items =
        _store.readJson(_ordersKey)?['items'] as List<dynamic>? ?? const [];
    final orders = [
      for (final item in items) Order.fromJson(item as Map<String, dynamic>),
    ]..sort((a, b) => b.placedAt.compareTo(a.placedAt));
    return orders;
  }

  @override
  Future<void> save(Order order) async {
    final orders = readAll()
      ..removeWhere((existing) => existing.id == order.id)
      ..add(order);
    await _store.writeJson(_ordersKey, {
      'items': [for (final item in orders) item.toJson()],
    });
  }

  @override
  DeliveryAddress? readLastAddress() {
    final json = _store.readJson(_addressKey);
    return json == null ? null : DeliveryAddress.fromJson(json);
  }

  @override
  Future<void> saveLastAddress(DeliveryAddress address) =>
      _store.writeJson(_addressKey, address.toJson());
}
