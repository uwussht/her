import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/order.dart';
import '../domain/payment_service.dart';
import 'checkout_controller.dart';
import 'product_labels.dart';
import 'shop_labels.dart';
import 'shop_providers.dart';
import 'widgets/address_form.dart';
import 'widgets/card_form.dart';
import 'widgets/price_row.dart';

/// Checkout: address, then payment.
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _cardFormKey = GlobalKey<FormState>();
  final _cardControllers = CardFormControllers();

  @override
  void dispose() {
    _cardControllers.dispose();
    super.dispose();
  }

  Future<void> _pay() async {
    final controller = ref.read(checkoutControllerProvider.notifier);
    final state = ref.read(checkoutControllerProvider);

    CardDetails? card;
    if (state.method.needsCardDetails) {
      card = _cardControllers.details;
      if (card == null) {
        // Show the field errors when the form is on screen, and always say
        // something: tapping Pay must never do nothing at all.
        _cardFormKey.currentState?.validate();
        controller.reportInvalidCard();
        return;
      }
    }
    final order = await controller.placeOrder(card: card);
    if (!mounted || order == null) return;
    context.pushReplacement(AppRoutes.orderPlaced(order.id));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final state = ref.watch(checkoutControllerProvider);
    final totals = ref.watch(cartTotalsProvider);
    final cart = ref.watch(cartControllerProvider);

    // She emptied the cart from another screen.
    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.checkoutTitle)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.cartEmpty, style: context.textTheme.titleLarge),
                const SizedBox(height: AppSpacing.md),
                FilledButton(
                  onPressed: () => context.go(AppRoutes.shop),
                  child: Text(l10n.cartGoShopping),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.checkoutTitle),
        leading: state.step == CheckoutStep.payment
            ? BackButton(
                onPressed: () => ref
                    .read(checkoutControllerProvider.notifier)
                    .backToAddress(),
              )
            : null,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          StepProgress(
            step: state.step == CheckoutStep.address ? 1 : 2,
            total: 2,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            state.step == CheckoutStep.address
                ? l10n.checkoutStepAddress
                : l10n.checkoutStepPayment,
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.lg),

          if (state.step == CheckoutStep.address)
            AddressForm(
              initial: state.address,
              onSubmit: ref
                  .read(checkoutControllerProvider.notifier)
                  .setAddress,
            )
          else ...[
            _AddressSummary(address: state.address!),
            const SizedBox(height: AppSpacing.lg),
            for (final method in PaymentMethod.values) ...[
              OptionCard(
                icon: switch (method) {
                  PaymentMethod.kaspi => Icons.account_balance_wallet_rounded,
                  PaymentMethod.card => Icons.credit_card_rounded,
                  PaymentMethod.cashOnDelivery => Icons.payments_rounded,
                },
                title: method.label(l10n),
                subtitle: method.note(l10n),
                selected: state.method == method,
                tone: AppTone.green,
                onTap: () => ref
                    .read(checkoutControllerProvider.notifier)
                    .setMethod(method),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
            if (state.method.needsCardDetails) ...[
              const SizedBox(height: AppSpacing.md),
              CardForm(formKey: _cardFormKey, controllers: _cardControllers),
            ],
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                children: [
                  PriceRow(
                    label: l10n.cartSubtotal,
                    value: formatTenge(l10n, locale, totals.subtotal),
                  ),
                  PriceRow(
                    label: l10n.cartDelivery,
                    value: totals.delivery == 0
                        ? l10n.cartDeliveryFree
                        : formatTenge(l10n, locale, totals.delivery),
                  ),
                  const Divider(height: AppSpacing.lg),
                  PriceRow(
                    label: l10n.cartTotal,
                    value: formatTenge(l10n, locale, totals.total),
                    emphasised: true,
                  ),
                ],
              ),
            ),
            if (state.failure case final failure?) ...[
              const SizedBox(height: AppSpacing.md),
              AppCard(
                elevated: false,
                color: context.colors.errorContainer,
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: AppSizes.iconSm,
                      color: context.colors.error,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        paymentFailureMessage(l10n, failure),
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            LoadingButton(
              label: l10n.paymentPay(formatTenge(l10n, locale, totals.total)),
              icon: Icons.lock_outline_rounded,
              isLoading: state.isPaying,
              onPressed: _pay,
            ),
          ],
        ],
      ),
    );
  }
}

class _AddressSummary extends StatelessWidget {
  const _AddressSummary({required this.address});

  final DeliveryAddress address;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      elevated: false,
      color: context.palette.surfaceMuted,
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: context.colors.primary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.orderDeliveryTo, style: context.textTheme.labelSmall),
                Text(
                  '${address.fullName} · ${address.phone}',
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  [address.city, address.street, ?address.apartment].join(', '),
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
