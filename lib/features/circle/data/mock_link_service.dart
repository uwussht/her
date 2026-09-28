import 'package:uuid/uuid.dart';

import '../domain/circle_link.dart';
import '../domain/circle_repository.dart';
import '../domain/invite_code.dart';

/// Stands in for the backend that pairs two devices.
///
/// Redeeming a real code needs Firestore: the invite is written by her device
/// and claimed by his. Until that exists this validates the code the same way
/// the backend will, rejects her own invites, and pairs her with a placeholder
/// peer so the viewer side can be built and tested.
class MockLinkService implements LinkService {
  const MockLinkService({this.latency = const Duration(milliseconds: 600)});

  static const Uuid _uuid = Uuid();

  final Duration latency;

  /// Names the demo peer gets, by link kind.
  static const Map<LinkKind, String> demoPeerNames = {
    LinkKind.partner: 'Demo partner',
    LinkKind.family: 'Demo family member',
  };

  @override
  Future<CircleLink> redeem({
    required String code,
    required LinkKind kind,
    required List<CircleLink> existing,
  }) async {
    final normalized = InviteCode.normalize(code);
    if (!InviteCode.isValid(normalized)) {
      throw const LinkFailure(LinkFailureReason.malformed);
    }
    if (existing.any((link) => link.code == normalized)) {
      throw const LinkFailure(LinkFailureReason.ownCode);
    }
    if (existing.any((link) => link.kind == kind && link.isActive)) {
      throw const LinkFailure(LinkFailureReason.alreadyLinked);
    }
    if (latency > Duration.zero) await Future<void>.delayed(latency);

    final now = DateTime.now();
    return CircleLink(
      id: _uuid.v4(),
      kind: kind,
      side: LinkSide.viewer,
      code: normalized,
      status: LinkStatus.active,
      peerUid: 'demo-peer',
      peerName: demoPeerNames[kind],
      createdAt: now,
      linkedAt: now,
    );
  }

  @override
  Future<void> revoke(CircleLink link) async {
    // Nothing to tell: there is no backend yet. Unlinking is local, and must
    // work offline in any case.
  }
}
