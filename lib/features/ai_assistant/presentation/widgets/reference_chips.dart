import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../learn/presentation/learn_providers.dart';
import '../../../shop/presentation/shop_providers.dart';
import '../../domain/chat_message.dart';

/// Lessons and products an answer points at.
///
/// Titles come from the catalogue rather than the answer, so a reference to
/// something that has been removed simply disappears.
class ReferenceChips extends ConsumerWidget {
  const ReferenceChips({required this.references, super.key});

  final List<ChatReference> references;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chips = <Widget>[
      for (final reference in references) ?_chipFor(context, ref, reference),
    ];
    if (chips.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.xs),
        Text(
          context.l10n.aiReferencesTitle,
          style: context.textTheme.labelSmall,
        ),
        const SizedBox(height: AppSpacing.xxs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xxs,
          children: chips,
        ),
      ],
    );
  }

  Widget? _chipFor(
    BuildContext context,
    WidgetRef ref,
    ChatReference reference,
  ) {
    switch (reference.kind) {
      case ReferenceKind.lesson:
        final item = ref.watch(contentByIdProvider(reference.id));
        if (item == null) return null;
        return _ReferenceChip(
          icon: Icons.play_lesson_outlined,
          label: item.title.of(context),
          onTap: () => context.push(AppRoutes.learnItem(item.id)),
        );
      case ReferenceKind.product:
        final product = ref.watch(productByIdProvider(reference.id));
        if (product == null) return null;
        return _ReferenceChip(
          icon: Icons.shopping_bag_outlined,
          label: product.title.of(context),
          onTap: () => context.push(AppRoutes.product(product.id)),
        );
    }
  }
}

class _ReferenceChip extends StatelessWidget {
  const _ReferenceChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: AppSizes.iconSm, color: context.colors.primary),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
