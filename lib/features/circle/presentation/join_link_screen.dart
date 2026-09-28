import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/circle_link.dart';
import '../domain/circle_repository.dart';
import '../domain/invite_code.dart';
import 'circle_providers.dart';

/// Accepting someone else's invite code.
class JoinLinkScreen extends ConsumerStatefulWidget {
  const JoinLinkScreen({required this.kind, super.key});

  final LinkKind kind;

  @override
  ConsumerState<JoinLinkScreen> createState() => _JoinLinkScreenState();
}

class _JoinLinkScreenState extends ConsumerState<JoinLinkScreen> {
  final _controller = TextEditingController();
  bool _isJoining = false;
  LinkFailureReason? _failure;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _message(LinkFailureReason reason, BuildContext context) {
    final l10n = context.l10n;
    return switch (reason) {
      LinkFailureReason.malformed => l10n.circleJoinInvalid,
      LinkFailureReason.unknown => l10n.circleJoinUnknown,
      LinkFailureReason.ownCode => l10n.circleJoinOwnCode,
      LinkFailureReason.alreadyLinked => l10n.circleJoinAlready,
      LinkFailureReason.network => l10n.circleJoinNetwork,
    };
  }

  Future<void> _join() async {
    final code = _controller.text;
    if (!InviteCode.isValid(code)) {
      setState(() => _failure = LinkFailureReason.malformed);
      return;
    }
    setState(() {
      _isJoining = true;
      _failure = null;
    });
    final messenger = ScaffoldMessenger.of(context);
    final joined = context.l10n.circleJoined;
    try {
      await ref
          .read(circleControllerProvider.notifier)
          .join(code: code, kind: widget.kind);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(joined)));
      Navigator.of(context).pop();
    } on LinkFailure catch (failure) {
      if (!mounted) return;
      setState(() {
        _isJoining = false;
        _failure = failure.reason;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final failure = _failure;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.circleJoinTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          Text(l10n.circleJoinBody, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _controller,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            maxLength: 8,
            enabled: !_isJoining,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(letterSpacing: 4),
            decoration: InputDecoration(
              hintText: l10n.circleJoinHint,
              counterText: '',
              errorText: failure == null ? null : _message(failure, context),
            ),
            onChanged: (_) {
              if (failure != null) setState(() => _failure = null);
            },
            onSubmitted: (_) => _join(),
          ),
          const SizedBox(height: AppSpacing.md),
          LoadingButton(
            label: l10n.circleJoinAction,
            icon: Icons.link_rounded,
            isLoading: _isJoining,
            onPressed: _isJoining ? null : _join,
          ),
        ],
      ),
    );
  }
}
