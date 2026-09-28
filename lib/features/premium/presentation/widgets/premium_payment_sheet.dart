import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../shop/domain/order.dart';
import '../../../shop/domain/payment_service.dart';
import '../../../shop/presentation/product_labels.dart';
import '../../../shop/presentation/shop_labels.dart';
import '../../../shop/presentation/widgets/card_form.dart';
import '../../domain/premium_plan.dart';
import '../premium_controller.dart';

/// Paying for premium.
///
/// Reuses the shop's payment method list and card form, so there is one card
/// validator and one place that knows what Kaspi needs. Cash on delivery is
/// not offered: a subscription cannot be handed to a courier.
class PremiumPaymentSheet extends ConsumerStatefulWidget {
  const PremiumPaymentSheet({required this.plan, super.key});

  final PremiumPlan plan;

  static const List<PaymentMethod> methods = [
    PaymentMethod.kaspi,
    PaymentMethod.card,
  ];

  /// Returns true when the payment went through.
  static Future<bool> show(BuildContext context, PremiumPlan plan) async {
    final paid = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => PremiumPaymentSheet(plan: plan),
    );
    return paid ?? false;
  }

  @override
  ConsumerState<PremiumPaymentSheet> createState() =>
      _PremiumPaymentSheetState();
}

class _PremiumPaymentSheetState extends ConsumerState<PremiumPaymentSheet> {
  final _cardControllers = CardFormControllers();
  final _formKey = GlobalKey<FormState>();
  PaymentMethod _method = PaymentMethod.kaspi;
  bool _isPaying = false;
  PaymentFailureReason? _failure;

  @override
  void dispose() {
    _cardControllers.dispose();
    super.dispose();
  }

  Future<void> _pay() async {
    CardDetails? card;
    if (_method.needsCardDetails) {
      card = _cardControllers.details;
      if (card == null) {
        _formKey.currentState?.validate();
        setState(() => _failure = PaymentFailureReason.invalidCard);
        return;
      }
    }
    setState(() {
      _isPaying = true;
      _failure = null;
    });
    final result = await ref
        .read(premiumControllerProvider.notifier)
        .subscribe(plan: widget.plan, method: _method, card: card);
    if (!mounted) return;
    switch (result) {
      case PaymentSucceeded():
        Navigator.of(context).pop(true);
      case PaymentFailed(:final reason):
        setState(() {
          _isPaying = false;
          _failure = reason;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final price = formatTenge(l10n, locale, widget.plan.priceTenge);
    final failure = _failure;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.lg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.premiumPayTitle, style: context.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.premiumTrialNote(price),
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.md),
          RadioGroup<PaymentMethod>(
            groupValue: _method,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _method = value;
                _failure = null;
              });
            },
            child: Column(
              children: [
                for (final method in PremiumPaymentSheet.methods)
                  RadioListTile<PaymentMethod>(
                    value: method,
                    contentPadding: EdgeInsets.zero,
                    title: Text(method.label(l10n)),
                    subtitle: Text(method.note(l10n)),
                  ),
              ],
            ),
          ),
          if (_method.needsCardDetails) ...[
            const SizedBox(height: AppSpacing.xs),
            CardForm(formKey: _formKey, controllers: _cardControllers),
          ],
          if (failure != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              paymentFailureMessage(l10n, failure),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.error,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          LoadingButton(
            label: l10n.paymentPay(price),
            icon: Icons.lock_rounded,
            isLoading: _isPaying,
            onPressed: _isPaying ? null : _pay,
          ),
        ],
      ),
    );
  }
}
