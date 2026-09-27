import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/features/shop/domain/cart.dart';
import 'package:her_circle/features/shop/domain/product.dart';

LocalizedText t(String value) => LocalizedText({'ru': value, 'en': value});

Product product(
  String id, {
  int price = 1000,
  int? oldPrice,
  bool inStock = true,
}) {
  return Product(
    id: id,
    category: ProductCategory.periodCare,
    title: t(id),
    description: t('d'),
    price: price,
    oldPrice: oldPrice,
    sellerId: 's1',
    inStock: inStock,
  );
}

void main() {
  final catalogue = {
    'a': product('a', price: 2000, oldPrice: 2500),
    'b': product('b', price: 5000),
    'gone': product('gone', inStock: false),
  };

  test('an empty cart has no items and no delivery fee', () {
    const cart = Cart();
    expect(cart.isEmpty, isTrue);
    expect(cart.itemCount, 0);
    expect(cart.subtotal(catalogue), 0);
    expect(cart.delivery(catalogue), 0);
    expect(cart.amountToFreeDelivery(catalogue), isNull);
  });

  test('adding the same product increases its quantity', () {
    final cart = const Cart().add('a').add('a', quantity: 2);
    expect(cart.lines.length, 1);
    expect(cart.quantityOf('a'), 3);
    expect(cart.itemCount, 3);
  });

  test('quantity is capped per line', () {
    final cart = const Cart().add('a', quantity: 99);
    expect(cart.quantityOf('a'), Cart.maxQuantityPerLine);
  });

  test('setting a quantity to zero removes the line', () {
    final cart = const Cart().add('a').add('b');
    expect(cart.setQuantity('a', 0).contains('a'), isFalse);
    expect(cart.setQuantity('a', 0).contains('b'), isTrue);
    expect(cart.setQuantity('a', -5).lines.length, 1);
  });

  test('totals add up, with delivery below the free threshold', () {
    final cart = const Cart().add('a', quantity: 2);
    expect(cart.subtotal(catalogue), 4000);
    expect(cart.delivery(catalogue), Cart.deliveryFee);
    expect(cart.total(catalogue), 4000 + Cart.deliveryFee);
    expect(cart.amountToFreeDelivery(catalogue), 11000);
  });

  test('delivery is free at the threshold', () {
    final cart = const Cart().add('b', quantity: 3);
    expect(cart.subtotal(catalogue), 15000);
    expect(cart.delivery(catalogue), 0);
    expect(cart.amountToFreeDelivery(catalogue), isNull);
  });

  test('savings come from the crossed-out prices', () {
    final cart = const Cart().add('a', quantity: 2).add('b');
    expect(cart.savings(catalogue), 1000);
  });

  test('unknown products are priced at zero rather than crashing', () {
    final cart = const Cart().add('missing');
    expect(cart.subtotal(catalogue), 0);
  });

  test('pruning drops products that are gone or out of stock', () {
    final cart = const Cart().add('a').add('gone').add('missing');
    final pruned = cart.prunedAgainst(catalogue);
    expect(pruned.lines.map((line) => line.productId), ['a']);
  });

  test('a cart line survives a JSON round trip', () {
    const line = CartLine(productId: 'a', quantity: 3);
    expect(CartLine.fromJson(line.toJson()), line);
  });
}
