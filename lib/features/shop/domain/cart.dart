import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

/// One line in the cart. Only the id and quantity are stored, so prices and
/// stock always come from the live catalogue.
@freezed
abstract class CartLine with _$CartLine {
  const factory CartLine({
    required String productId,
    @Default(1) int quantity,
  }) = _CartLine;

  factory CartLine.fromJson(Map<String, dynamic> json) =>
      _$CartLineFromJson(json);
}

/// The cart, priced against the catalogue.
@immutable
class Cart {
  const Cart({this.lines = const []});

  final List<CartLine> lines;

  static const int maxQuantityPerLine = 20;

  /// Free delivery from this subtotal, in tenge.
  static const int freeDeliveryFrom = 15000;
  static const int deliveryFee = 990;

  bool get isEmpty => lines.isEmpty;

  int get itemCount => lines.fold(0, (sum, line) => sum + line.quantity);

  int quantityOf(String productId) {
    for (final line in lines) {
      if (line.productId == productId) return line.quantity;
    }
    return 0;
  }

  bool contains(String productId) => quantityOf(productId) > 0;

  Cart copyWith({List<CartLine>? lines}) => Cart(lines: lines ?? this.lines);

  /// Adds [quantity] of [productId], capped at [maxQuantityPerLine].
  Cart add(String productId, {int quantity = 1}) {
    final existing = quantityOf(productId);
    return setQuantity(productId, existing + quantity);
  }

  /// Sets an exact quantity. Zero or less removes the line.
  Cart setQuantity(String productId, int quantity) {
    if (quantity <= 0) return remove(productId);
    final capped = quantity > maxQuantityPerLine
        ? maxQuantityPerLine
        : quantity;
    final next = [
      for (final line in lines)
        if (line.productId == productId)
          line.copyWith(quantity: capped)
        else
          line,
    ];
    if (!contains(productId)) {
      next.add(CartLine(productId: productId, quantity: capped));
    }
    return Cart(lines: next);
  }

  Cart remove(String productId) => Cart(
    lines: [
      for (final line in lines)
        if (line.productId != productId) line,
    ],
  );

  /// Drops lines whose product has gone from the catalogue or out of stock.
  Cart prunedAgainst(Map<String, Product> catalogue) => Cart(
    lines: [
      for (final line in lines)
        if (catalogue[line.productId]?.inStock ?? false) line,
    ],
  );

  int subtotal(Map<String, Product> catalogue) => lines.fold(
    0,
    (sum, line) =>
        sum + (catalogue[line.productId]?.price ?? 0) * line.quantity,
  );

  /// What she saves against the crossed-out prices.
  int savings(Map<String, Product> catalogue) => lines.fold(0, (sum, line) {
    final product = catalogue[line.productId];
    if (product == null || !product.isDiscounted) return sum;
    return sum + (product.oldPrice! - product.price) * line.quantity;
  });

  int delivery(Map<String, Product> catalogue) =>
      isEmpty || subtotal(catalogue) >= freeDeliveryFrom ? 0 : deliveryFee;

  int total(Map<String, Product> catalogue) =>
      subtotal(catalogue) + delivery(catalogue);

  /// How much more she needs for free delivery, or null once it is free.
  int? amountToFreeDelivery(Map<String, Product> catalogue) {
    if (isEmpty) return null;
    final remaining = freeDeliveryFrom - subtotal(catalogue);
    return remaining > 0 ? remaining : null;
  }
}

abstract interface class CartRepository {
  Cart read();

  Future<void> save(Cart cart);
}
