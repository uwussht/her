import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';
import '../../profile/domain/personalization.dart';
import '../../tracker/domain/tracker_enums.dart';

part 'daily_tip.freezed.dart';
part 'daily_tip.g.dart';

/// A short tip for the home feed, optionally tied to a cycle phase or stage.
@freezed
abstract class DailyTip with _$DailyTip {
  const factory DailyTip({
    required String id,
    @LocalizedTextConverter() required LocalizedText text,
    @Default(<CyclePhase>[]) List<CyclePhase> phases,
    @Default(<LifeStage>[]) List<LifeStage> stages,

    /// Opens this Learn item when tapped.
    String? contentId,
  }) = _DailyTip;

  factory DailyTip.fromJson(Map<String, dynamic> json) =>
      _$DailyTipFromJson(json);
}
