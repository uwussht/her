import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/circle_link.dart';
import '../../domain/share_scope.dart';
import '../circle_labels.dart';

/// Her sharing switches. One per scope, nothing on by accident.
class SharingSwitches extends StatelessWidget {
  const SharingSwitches({
    required this.link,
    required this.onChanged,
    required this.onStopAll,
    super.key,
  });

  final CircleLink link;
  final void Function(ShareScope scope, bool on) onChanged;
  final VoidCallback onStopAll;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            link.kind == LinkKind.partner
                ? l10n.circleSharingTitlePartner
                : l10n.circleSharingTitleFamily,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(l10n.circleSharingBody, style: context.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.xs),
          for (final scope in ShareScope.values)
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: link.allows(scope),
              onChanged: (on) => onChanged(scope, on),
              secondary: Icon(scope.icon),
              title: Text(scope.label(l10n)),
            ),
          if (link.shares.isEmpty)
            Text(l10n.circleSharingOff, style: context.textTheme.labelMedium)
          else
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: onStopAll,
                icon: const Icon(Icons.visibility_off_outlined),
                label: Text(l10n.circleStopSharing),
              ),
            ),
        ],
      ),
    );
  }
}
