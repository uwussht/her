import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../domain/chat_message.dart';
import 'emergency_card.dart';
import 'reference_chips.dart';

/// One message. Her questions are pink, the answers green-tinted.
class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, required this.onRetry, super.key});

  final ChatMessage message;
  final VoidCallback onRetry;

  static const double _maxWidthFactor = 0.86;

  @override
  Widget build(BuildContext context) {
    if (message.isEmergency) {
      return const Padding(
        padding: EdgeInsets.only(bottom: AppSpacing.sm),
        child: EmergencyCard(),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Align(
        alignment: message.isUser
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.centerStart,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * _maxWidthFactor,
          ),
          child: message.isUser
              ? _UserBubble(message: message)
              : _AnswerBubble(message: message, onRetry: onRetry),
        ),
      ),
    );
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble({required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadius.card),
          topRight: Radius.circular(AppRadius.card),
          bottomLeft: Radius.circular(AppRadius.card),
          bottomRight: Radius.circular(AppRadius.sm),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          message.text,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
      ),
    );
  }
}

class _AnswerBubble extends StatelessWidget {
  const _AnswerBubble({required this.message, required this.onRetry});

  final ChatMessage message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: message.isError
            ? context.colors.errorContainer
            : context.palette.successContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadius.card),
          topRight: Radius.circular(AppRadius.card),
          bottomLeft: Radius.circular(AppRadius.sm),
          bottomRight: Radius.circular(AppRadius.card),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  message.isError
                      ? Icons.cloud_off_rounded
                      : Icons.auto_awesome_rounded,
                  size: AppSizes.iconSm,
                  color: message.isError
                      ? context.colors.error
                      : context.palette.success,
                ),
                const SizedBox(width: AppSpacing.xxs),
                Text(
                  l10n.aiAssistantName,
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              message.isError ? l10n.aiErrorBody : message.text,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            if (message.isError) ...[
              const SizedBox(height: AppSpacing.xxs),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(
                    Icons.refresh_rounded,
                    size: AppSizes.iconSm,
                  ),
                  label: Text(l10n.aiRetry),
                ),
              ),
            ] else ...[
              ReferenceChips(references: message.references),
              const SizedBox(height: AppSpacing.xs),
              // Spec 6: every answer carries the medical disclaimer.
              Text(
                l10n.aiAnswerDisclaimer,
                style: context.textTheme.labelSmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// The three dots while an answer is on its way.
class TypingBubble extends StatelessWidget {
  const TypingBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.palette.successContainer,
            borderRadius: AppRadius.cardBorder,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  size: AppSizes.iconSm,
                  color: context.palette.success,
                ),
                const SizedBox(width: AppSpacing.xxs),
                Text(
                  context.l10n.aiThinking,
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
