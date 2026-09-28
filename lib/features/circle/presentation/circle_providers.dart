import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/date_utils.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/domain/content_item.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../tracker/presentation/tracker_providers.dart';
import '../data/local_circle_repository.dart';
import '../data/mock_link_service.dart';
import '../data/mock_peer_snapshot_service.dart';
import '../domain/circle_link.dart';
import '../domain/circle_repository.dart';
import '../domain/family_lessons.dart';
import '../domain/invite_code.dart';
import '../domain/partner_summary.dart';
import '../domain/peer_snapshot_service.dart';
import '../domain/share_scope.dart';

part 'circle_providers.g.dart';

const _uuid = Uuid();

@Riverpod(keepAlive: true)
CircleRepository circleRepository(Ref ref) => LocalCircleRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

/// Pairs two devices.
///
/// Claiming an invite needs a server, so this is the mock until the Firestore
/// implementation lands with the rest of the backend.
@Riverpod(keepAlive: true)
LinkService linkService(Ref ref) => const MockLinkService();

@Riverpod(keepAlive: true)
PeerSnapshotService peerSnapshotService(Ref ref) =>
    const MockPeerSnapshotService();

@Riverpod(keepAlive: true)
PartnerSummaryService partnerSummaryService(Ref ref) =>
    const PartnerSummaryService();

@Riverpod(keepAlive: true)
FamilyLessons familyLessons(Ref ref) => const FamilyLessons();

/// Her partner and family links.
@Riverpod(keepAlive: true)
class CircleController extends _$CircleController {
  @override
  List<CircleLink> build() => ref.watch(circleRepositoryProvider).read();

  /// Creates the invite she sends. Her side shares the defaults for the kind,
  /// which she can change before anyone accepts.
  Future<CircleLink> createInvite(LinkKind kind) async {
    final link = CircleLink(
      id: _uuid.v4(),
      kind: kind,
      side: LinkSide.sharer,
      code: InviteCode.generate().value,
      createdAt: DateTime.now(),
      shares: kind == LinkKind.partner
          ? ShareScope.partnerDefaults
          : ShareScope.familyDefaults,
    );
    await _write([...state, link]);
    return link;
  }

  /// Accepts someone else's invite. Throws [LinkFailure].
  Future<CircleLink> join({
    required String code,
    required LinkKind kind,
  }) async {
    final link = await ref
        .read(linkServiceProvider)
        .redeem(code: code, kind: kind, existing: state);
    await _write([...state, link]);
    return link;
  }

  Future<void> setScope(String id, ShareScope scope, {required bool on}) {
    return _update(id, (link) {
      final shares = {...link.shares};
      if (on) {
        shares.add(scope);
      } else {
        shares.remove(scope);
      }
      return link.copyWith(shares: shares);
    });
  }

  /// Turns every switch off in one tap, for when she wants sharing to stop
  /// but not the link itself.
  Future<void> stopSharing(String id) =>
      _update(id, (link) => link.copyWith(shares: const {}));

  Future<void> setPeerName(String id, String name) {
    final trimmed = name.trim();
    return _update(
      id,
      (link) => link.copyWith(peerName: trimmed.isEmpty ? null : trimmed),
    );
  }

  /// Pretends the invite was accepted on another device.
  ///
  /// The real transition comes from Firestore. Until then this is the only way
  /// to reach the linked state, and the UI says as much.
  Future<void> markAcceptedForDemo(String id) => _update(
    id,
    (link) => link.copyWith(
      status: LinkStatus.active,
      linkedAt: DateTime.now(),
      peerUid: link.peerUid ?? 'demo-peer',
    ),
  );

  Future<void> unlink(String id) async {
    final link = _byId(id);
    if (link == null) return;
    await ref.read(linkServiceProvider).revoke(link);
    await _write([
      for (final other in state)
        if (other.id != id) other,
    ]);
  }

  CircleLink? _byId(String id) {
    for (final link in state) {
      if (link.id == id) return link;
    }
    return null;
  }

  Future<void> _update(String id, CircleLink Function(CircleLink) change) {
    return _write([
      for (final link in state)
        if (link.id == id) change(link) else link,
    ]);
  }

  Future<void> _write(List<CircleLink> links) async {
    state = links;
    await ref.read(circleRepositoryProvider).save(links);
  }
}

/// Her link of one kind, or null when there is none.
@riverpod
CircleLink? linkOfKind(Ref ref, LinkKind kind) {
  for (final link in ref.watch(circleControllerProvider)) {
    if (link.kind == kind) return link;
  }
  return null;
}

/// What the other person sees, built from her own data.
///
/// Used for her "see what he sees" preview, and later for the payload the
/// backend stores for him. Keyed by link id rather than by the scope set, so
/// the provider is cached properly and follows her switches.
@riverpod
PartnerSummary sharedSummary(Ref ref, String linkId) {
  final shares =
      ref
          .watch(circleControllerProvider)
          .where((link) => link.id == linkId)
          .firstOrNull
          ?.shares ??
      const <ShareScope>{};
  final log = ref.watch(cycleTimelineProvider).logFor(today());
  return ref
      .watch(partnerSummaryServiceProvider)
      .build(
        shares: shares,
        profile: ref.watch(userProfileControllerProvider),
        timeline: ref.watch(cycleTimelineProvider),
        mood: log?.mood,
        symptoms: log?.symptoms ?? const [],
      );
}

/// What this device is told about the peer, on the viewer side.
@riverpod
Future<PartnerSummary> peerSummary(Ref ref, String linkId) async {
  final links = ref.watch(circleControllerProvider);
  final link = links.firstWhere((link) => link.id == linkId);
  return ref.watch(peerSnapshotServiceProvider).fetch(link);
}

/// Lessons a mother and daughter get together.
@riverpod
List<ContentItem> sharedFamilyLessons(Ref ref) => ref
    .watch(familyLessonsProvider)
    .select(ref.watch(contentLibraryProvider).value ?? const []);
