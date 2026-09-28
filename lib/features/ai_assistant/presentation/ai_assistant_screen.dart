import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../premium/presentation/premium_gate_sheet.dart';
import 'ai_providers.dart';
import 'chat_controller.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_composer.dart';
import 'widgets/quota_banner.dart';
import 'widgets/suggestion_chips.dart';

/// Circle AI: the chat, the free-tier counter and the safety rails.
class AiAssistantScreen extends ConsumerStatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  ConsumerState<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends ConsumerState<AiAssistantScreen> {
  final _input = TextEditingController();
  final _scroll = ScrollController();

  @override
  void dispose() {
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send(String text) async {
    final message = text.trim();
    if (message.isEmpty) return;
    _input.clear();
    final sent = await ref.read(chatControllerProvider.notifier).send(message);
    if (!sent) {
      // Over the daily limit: the question stays in the field so she does not
      // have to retype it after upgrading.
      _input.text = message;
    }
    _scrollToEnd();
  }

  void _scrollToEnd() {
    if (!_scroll.hasClients) return;
    // Twice: the list builds lazily, so the first jump only reveals the new
    // bubble, and the extent it lands on is the one that knows about it.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      _scroll.jumpTo(_scroll.position.maxScrollExtent);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scroll.hasClients) return;
        _scroll.jumpTo(_scroll.position.maxScrollExtent);
      });
    });
  }

  Future<void> _confirmClear() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.aiClearConfirmTitle),
        content: Text(l10n.aiClearConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.actionCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.aiClearConfirmAction),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(chatControllerProvider.notifier).clear();
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.aiCleared)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(chatControllerProvider);
    final messagesLeft = ref.watch(aiMessagesLeftProvider);
    final questions = ref.watch(aiSuggestedQuestionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aiAssistantName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.xs),
            child: Center(child: QuotaPill(messagesLeft: messagesLeft)),
          ),
          if (!state.isEmpty)
            IconButton(
              tooltip: l10n.aiClear,
              onPressed: _confirmClear,
              icon: const Icon(Icons.delete_outline_rounded),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xs,
                AppSpacing.md,
                AppSpacing.md,
              ),
              children: [
                const DisclaimerCard(),
                const SizedBox(height: AppSpacing.xxs),
                Text(l10n.aiHistoryLocal, style: context.textTheme.labelSmall),
                const SizedBox(height: AppSpacing.md),
                if (state.isEmpty) ...[
                  Text(l10n.aiIntroTitle, style: context.textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    l10n.aiIntroBody,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.palette.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
                for (final message in state.messages)
                  ChatBubble(
                    message: message,
                    onRetry: () =>
                        ref.read(chatControllerProvider.notifier).retry(),
                  ),
                if (state.isSending) const TypingBubble(),
                if (state.limitReached) ...[
                  QuotaLimitCard(
                    onSeePremium: () => PremiumGateSheet.show(context),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
                if (!state.isSending)
                  SuggestionChips(questions: questions, onSelected: _send),
              ],
            ),
          ),
          ChatComposer(
            controller: _input,
            onSend: _send,
            enabled: !state.isSending,
          ),
        ],
      ),
    );
  }
}
