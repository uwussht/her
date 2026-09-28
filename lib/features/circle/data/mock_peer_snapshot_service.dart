import '../../profile/domain/personalization.dart';
import '../../tracker/domain/tracker_enums.dart';
import '../domain/circle_link.dart';
import '../domain/partner_summary.dart';
import '../domain/peer_snapshot_service.dart';
import '../domain/support_tips.dart';

/// Demo data for the viewer side, until Firestore serves the real snapshot.
///
/// Values are fixed rather than random, so the screen is predictable in tests
/// and in a demo. The UI labels it as sample data.
class MockPeerSnapshotService implements PeerSnapshotService {
  const MockPeerSnapshotService({
    this.latency = const Duration(milliseconds: 400),
  });

  final Duration latency;

  @override
  Future<PartnerSummary> fetch(CircleLink link) async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    return PartnerSummary(
      stage: LifeStage.trackingCycle,
      cycleDay: 12,
      phase: CyclePhase.fertile,
      mood: link.kind == LinkKind.partner ? Mood.good : null,
      tip: SupportTip.forDay(
        phase: CyclePhase.fertile,
        mood: Mood.good,
        stage: LifeStage.trackingCycle,
      ),
    );
  }
}
