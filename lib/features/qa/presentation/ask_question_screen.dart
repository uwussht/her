import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/domain/content_item.dart';
import '../../learn/presentation/content_labels.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../premium/presentation/premium_controller.dart';
import '../domain/qa_state.dart';
import 'qa_controller.dart';

/// Asks a doctor a question, anonymously by default.
class AskQuestionScreen extends ConsumerStatefulWidget {
  const AskQuestionScreen({super.key});

  @override
  ConsumerState<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends ConsumerState<AskQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _text = TextEditingController();
  ContentCategory _category = ContentCategory.cycleHealth;
  bool _anonymous = true;
  bool _sending = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final hasPremium = ref.read(hasPremiumProvider);

    setState(() => _sending = true);
    await ref
        .read(qaControllerProvider.notifier)
        .ask(text: _text.text, category: _category, anonymous: _anonymous);
    if (!mounted) return;
    setState(() => _sending = false);
    context.pop();
    messenger.showSnackBar(
      SnackBar(content: Text(hasPremium ? l10n.qaSentPriority : l10n.qaSent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final categories = ref.watch(visibleCategoriesProvider);
    final hasPremium = ref.watch(hasPremiumProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.qaAsk)),
      body: Form(
        key: _formKey,
        child: TitledPageLayout(
          title: l10n.qaAskTitle,
          bottom: LoadingButton(
            label: l10n.qaSend,
            icon: Icons.send_rounded,
            isLoading: _sending,
            onPressed: _send,
          ),
          children: [
            TextFormField(
              controller: _text,
              autofocus: true,
              minLines: 4,
              maxLines: 8,
              maxLength: 600,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(hintText: l10n.qaAskHint),
              validator: (value) =>
                  (value ?? '').trim().length < QaCatalogue.minQuestionLength
                  ? l10n.qaValidationTooShort
                  : null,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(l10n.qaAskCategory, style: context.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final category in categories)
                  ChoiceChip(
                    avatar: Icon(category.icon, size: 18),
                    label: Text(category.label(l10n)),
                    selected: _category == category,
                    onSelected: (_) => setState(() => _category = category),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              padding: EdgeInsets.zero,
              child: SwitchListTile(
                value: _anonymous,
                onChanged: (value) => setState(() => _anonymous = value),
                title: Text(l10n.qaAskAnonymously),
                subtitle: Text(l10n.qaAskAnonymouslyNote),
                secondary: const Icon(Icons.visibility_off_outlined),
              ),
            ),
            if (hasPremium) ...[
              const SizedBox(height: AppSpacing.sm),
              PillBadge(
                label: l10n.qaPriorityBadge,
                tone: AppTone.warning,
                icon: Icons.bolt_rounded,
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            DisclaimerCard(text: l10n.qaDisclaimer),
          ],
        ),
      ),
    );
  }
}
