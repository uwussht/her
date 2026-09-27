import '../../../core/services/storage/local_store.dart';
import '../domain/cart.dart';

/// The cart, kept on device so it survives a restart.
class LocalCartRepository implements CartRepository {
  const LocalCartRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'shop.cart.$_uid';

  @override
  Cart read() {
    final lines = _store.readJson(_key)?['lines'] as List<dynamic>? ?? const [];
    return Cart(
      lines: [
        for (final line in lines)
          CartLine.fromJson(line as Map<String, dynamic>),
      ],
    );
  }

  @override
  Future<void> save(Cart cart) => _store.writeJson(_key, {
    'lines': [for (final line in cart.lines) line.toJson()],
  });
}
