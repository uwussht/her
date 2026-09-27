import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/shop/domain/order.dart';
import 'package:her_circle/features/shop/domain/payment_service.dart';
import 'package:her_circle/features/shop/presentation/cart_screen.dart';
import 'package:her_circle/features/shop/presentation/checkout_screen.dart';
import 'package:her_circle/features/shop/presentation/order_detail_screen.dart';
import 'package:her_circle/features/shop/presentation/order_placed_screen.dart';
import 'package:her_circle/features/shop/presentation/orders_screen.dart';
import 'package:her_circle/features/shop/presentation/product_detail_screen.dart';
import 'package:her_circle/features/shop/presentation/shop_providers.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openShop(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    await tester.pumpAndSettle();
  }

  /// Vertical centre of the first match, measured from its render box so no
  /// finder is resolved twice.
  double? centreOf(Finder finder) {
    final matches = finder.evaluate();
    if (matches.isEmpty) return null;
    final box = matches.first.renderObject as RenderBox?;
    if (box == null || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero).dy + box.size.height / 2;
  }

  /// Scrolls the page list back to the top.
  Future<void> scrollToTop(WidgetTester tester) async {
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 3000));
    await tester.pumpAndSettle();
  }

  /// Types into the search field, which is at the top of the page and may
  /// have been scrolled out of the lazily built list.
  Future<void> search(WidgetTester tester, String query) async {
    await scrollToTop(tester);
    await tester.enterText(find.byType(TextField).first, query);
    await tester.pumpAndSettle();
  }

  /// Scrolls the page list until [finder] is on screen and clear of the
  /// bottom bar.
  ///
  /// Explicit drags rather than [WidgetTester.scrollUntilVisible], which
  /// stalls on these screens because the page list contains horizontal
  /// carousels that take part in the same gesture arena.
  Future<void> reveal(WidgetTester tester, Finder finder) async {
    const bottomSafeArea = 120.0;
    final viewport =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;
    // Some screens (the confirmation, for one) do not scroll at all.
    final canScroll = find.byType(Scrollable).evaluate().isNotEmpty;

    if (canScroll && centreOf(finder) == null) {
      // Not built: it may be above the current scroll position.
      await scrollToTop(tester);
      for (var attempt = 0; attempt < 12; attempt++) {
        if (centreOf(finder) != null) break;
        await tester.drag(find.byType(Scrollable).first, const Offset(0, -260));
        await tester.pumpAndSettle();
      }
    }
    expect(finder, findsWidgets, reason: 'never scrolled into view');

    if (canScroll) {
      await tester.ensureVisible(finder.first);
      await tester.pumpAndSettle();
    }

    // Nudge anything left under the bottom bar or a snack bar.
    final centre = centreOf(finder);
    if (canScroll && centre != null && centre > viewport - bottomSafeArea) {
      await tester.drag(
        find.byType(Scrollable).first,
        Offset(0, viewport - bottomSafeArea - centre),
      );
      await tester.pumpAndSettle();
    }
  }

  /// SnackBars float above the buttons at the bottom of the page and they
  /// queue, so dismiss them outright before tapping anything.
  Future<void> clearSnackBars(WidgetTester tester) async {
    final messenger = find.byType(ScaffoldMessenger);
    if (messenger.evaluate().isEmpty) return;
    tester.state<ScaffoldMessengerState>(messenger.first).clearSnackBars();
    await tester.pumpAndSettle();
  }

  Future<void> tapAt(WidgetTester tester, Finder finder) async {
    await clearSnackBars(tester);
    await reveal(tester, finder);
    // Revealing can let a queued SnackBar surface.
    await clearSnackBars(tester);
    await tester.tap(finder.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapText(WidgetTester tester, String text) =>
      tapAt(tester, find.text(text));

  /// Fills the address step with a valid Kazakhstan address.
  Future<void> fillAddress(WidgetTester tester) async {
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Aruzhan Konysbay');
    await tester.enterText(fields.at(1), '7011234567');
    await tester.enterText(fields.at(2), 'Almaty');
    await tester.enterText(fields.at(3), 'Abay 10');
    await tester.pumpAndSettle();
    await tapText(tester, 'Continue to payment');
  }

  testWidgets('shows a timed row, filters and searches', (tester) async {
    await pumpHerCircle(
      tester,
      // Two days before the predicted period.
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-26)),
      prefs: {'settings.locale': 'en'},
    );
    await openShop(tester);

    expect(find.text('Your period is close — these help'), findsOneWidget);
    await reveal(tester, find.text('18 products'));

    await tapText(tester, 'Period care');
    await reveal(tester, find.text('4 products'));

    await tapText(tester, 'All');
    await search(tester, 'pillow');
    await reveal(tester, find.text('1 products'));
  });

  testWidgets('hides intimate health from a teen', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        ageGroup: AgeGroup.age10to15,
        lifeStage: LifeStage.firstPeriod,
      ),
      prefs: {'settings.locale': 'en'},
    );
    await openShop(tester);

    expect(find.text('Intimate health'), findsNothing);
    await reveal(tester, find.text('17 products'));
  });

  testWidgets('product page shows reviews, seller and bundle contents', (
    tester,
  ) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openShop(tester);

    await search(tester, 'Hospital Bag');
    await tapText(tester, 'Hospital Bag Bundle');

    expect(find.byType(ProductDetailScreen), findsOneWidget);
    expect(find.text('Bundle'), findsWidgets);
    // The bundle lists what is inside it.
    await reveal(tester, find.text("What's in the bundle"));
    expect(find.text('Night pads, 10 pack'), findsOneWidget);
    // Seller with the local-brand badge.
    await reveal(tester, find.text('Mama Store KZ'));
    expect(find.text('Local brand'), findsWidgets);
    // Linked article from step 5.
    await reveal(tester, find.text('Read about this'));
    expect(find.text('Your hospital bag: the full list'), findsOneWidget);
    // Reviews.
    await reveal(tester, find.text('Reviews · 1'));
    expect(find.text('Verified purchase'), findsWidgets);
  });

  testWidgets('cart totals, free delivery and quantity changes', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openShop(tester);

    await search(tester, 'Night pads, 10');
    await tapAt(tester, find.byIcon(Icons.add_shopping_cart_rounded));
    expect(find.text('Added to cart'), findsOneWidget);

    await tapAt(tester, find.byIcon(Icons.shopping_cart_outlined));
    expect(find.byType(CartScreen), findsOneWidget);
    // 1 890 ₸ is under the free-delivery threshold.
    expect(find.textContaining('Add'), findsWidgets);
    expect(find.text('990 ₸'), findsWidgets);

    // Ten packs clears the threshold, so delivery becomes free.
    for (var i = 0; i < 9; i++) {
      await tester.tap(find.byIcon(Icons.add_rounded));
      await tester.pumpAndSettle();
    }
    expect(
      container.read(cartControllerProvider).quantityOf('p_pads_night'),
      10,
    );
    expect(find.text('Free'), findsOneWidget);

    // Removing the line empties the cart.
    for (var i = 0; i < 10; i++) {
      final minus = find.byIcon(Icons.remove_rounded);
      if (minus.evaluate().isEmpty) break;
      await tester.tap(minus.first);
      await tester.pumpAndSettle();
    }
    await tester.tap(find.byIcon(Icons.delete_outline_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Your cart is empty'), findsOneWidget);
  });

  testWidgets('checkout with Kaspi places an order and tracks it', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openShop(tester);

    await search(tester, 'Belly');
    await tapAt(tester, find.byIcon(Icons.add_shopping_cart_rounded));
    await tapAt(tester, find.byIcon(Icons.shopping_cart_outlined));
    await tapText(tester, 'Checkout');

    expect(find.byType(CheckoutScreen), findsOneWidget);
    expect(find.text('Step 1 of 2'), findsOneWidget);
    await fillAddress(tester);

    expect(find.text('Step 2 of 2'), findsOneWidget);
    expect(find.text('Delivering to'), findsOneWidget);
    // Kaspi is the default in Kazakhstan.
    await tapText(tester, 'Pay 5\u2009490 ₸');
    await tester.pumpAndSettle();

    expect(find.byType(OrderPlacedScreen), findsOneWidget);
    expect(find.text('Order placed'), findsOneWidget);

    final orders = container.read(ordersControllerProvider);
    expect(orders.length, 1);
    final order = orders.single;
    expect(order.paymentMethod, PaymentMethod.kaspi);
    expect(order.total, 4500 + 990);
    expect(order.lines.single.productId, 'p_heatpad');
    expect(order.paymentReference, isNotNull);
    expect(order.address.phone, '+77011234567');
    // The cart is emptied once the order is placed.
    expect(container.read(cartControllerProvider).isEmpty, isTrue);

    await tapText(tester, 'Track order');
    expect(find.byType(OrderDetailScreen), findsOneWidget);
    expect(find.text('Placed'), findsWidgets);
    expect(find.text('Delivered'), findsWidgets);
    expect(find.text('Kaspi Pay'), findsWidgets);
  });

  testWidgets('a declined card is reported and can be retried', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openShop(tester);

    await search(tester, 'Belly');
    await tapAt(tester, find.byIcon(Icons.add_shopping_cart_rounded));
    await tapAt(tester, find.byIcon(Icons.shopping_cart_outlined));
    await tapText(tester, 'Checkout');
    await fillAddress(tester);

    await tapText(tester, 'Bank card');
    final cardFields = find.byType(TextFormField);
    await tester.enterText(cardFields.at(0), CardValidator.declineCard);
    await tester.enterText(cardFields.at(1), '1230');
    await tester.enterText(cardFields.at(2), '123');
    await tester.enterText(cardFields.at(3), 'ARUZHAN K');
    await tester.pumpAndSettle();

    await tapText(tester, 'Pay 5\u2009490 ₸');
    await reveal(tester, find.text('Payment declined. Try another card.'));
    expect(container.read(ordersControllerProvider), isEmpty);
    // The cart is untouched after a failure.
    expect(container.read(cartControllerProvider).isEmpty, isFalse);

    // A good card goes through.
    await tester.enterText(cardFields.at(0), '4242424242424242');
    await tester.pumpAndSettle();
    await tapText(tester, 'Pay 5\u2009490 ₸');
    await tester.pumpAndSettle();
    expect(find.byType(OrderPlacedScreen), findsOneWidget);
    expect(
      container.read(ordersControllerProvider).single.paymentMethod,
      PaymentMethod.card,
    );
  });

  testWidgets('an invalid card is caught before any payment', (tester) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openShop(tester);

    await search(tester, 'Belly');
    await tapAt(tester, find.byIcon(Icons.add_shopping_cart_rounded));
    await tapAt(tester, find.byIcon(Icons.shopping_cart_outlined));
    await tapText(tester, 'Checkout');
    await fillAddress(tester);
    await tapText(tester, 'Bank card');

    final cardFields = find.byType(TextFormField);
    await tester.enterText(cardFields.at(0), '1234567812345678');
    await tester.enterText(cardFields.at(1), '1220');
    await tester.enterText(cardFields.at(2), '12');
    await tester.pumpAndSettle();

    // Errors show as she types, not only when she taps Pay.
    expect(find.text('Check the card number'), findsOneWidget);
    expect(find.text('Check the expiry date'), findsOneWidget);
    expect(find.text('Check the CVC'), findsOneWidget);

    await tapText(tester, 'Pay 5\u2009490 ₸');
    await tester.pumpAndSettle();
    // Nothing is charged, and she is told why rather than left guessing.
    await reveal(tester, find.text("Those card details aren't valid."));
    expect(find.byType(OrderPlacedScreen), findsNothing);
  });

  testWidgets('the address is remembered for the next order', (tester) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openShop(tester);

    await search(tester, 'Belly');
    await tapAt(tester, find.byIcon(Icons.add_shopping_cart_rounded));
    await tapAt(tester, find.byIcon(Icons.shopping_cart_outlined));
    await tapText(tester, 'Checkout');
    await fillAddress(tester);
    await tapText(tester, 'Pay 5\u2009490 ₸');
    await tester.pumpAndSettle();
    await tapText(tester, 'Keep shopping');

    // Second order: the address step is prefilled.
    await search(tester, 'Belly');
    await tapAt(tester, find.byIcon(Icons.add_shopping_cart_rounded));
    await tapAt(tester, find.byIcon(Icons.shopping_cart_outlined));
    await tapText(tester, 'Checkout');
    expect(find.text('Aruzhan Konysbay'), findsOneWidget);
    expect(find.text('Almaty'), findsOneWidget);
  });

  testWidgets('subscribing to a box schedules deliveries', (tester) async {
    final container = await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-10)),
      prefs: {'settings.locale': 'en'},
    );
    await openShop(tester);

    await search(tester, 'period box');
    await tapText(tester, 'Monthly period box');

    await reveal(tester, find.text('Every cycle, 3 days before your period'));
    await tapText(tester, 'Subscribe');

    final subscription = container.read(
      subscriptionForProvider('p_box_period'),
    );
    expect(subscription, isNotNull);
    // Three days before the predicted period, which is 18 days out.
    expect(subscription!.nextDelivery, today().addDays(15));
    await reveal(tester, find.text('Delivery schedule'));
    expect(find.text('Cancel subscription'), findsOneWidget);

    await tapText(tester, 'Cancel subscription');
    expect(container.read(subscriptionForProvider('p_box_period')), isNull);
  });

  testWidgets('order history lists past orders', (tester) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openShop(tester);

    await tapAt(tester, find.byIcon(Icons.receipt_long_outlined));
    expect(find.byType(OrdersScreen), findsOneWidget);
    expect(find.text('No orders yet.'), findsOneWidget);
  });
}
