import 'package:freezed_annotation/freezed_annotation.dart';

import 'share_scope.dart';

part 'circle_link.freezed.dart';
part 'circle_link.g.dart';

/// Who the link connects her to.
enum LinkKind {
  /// A partner account (spec 5.7).
  partner,

  /// Moms & Daughters (spec 5.8).
  family,
}

/// Which end of the link this device is.
enum LinkSide {
  /// She shares her data; the toggles are hers.
  sharer,

  /// He (or her mother) sees what has been shared.
  viewer,
}

enum LinkStatus {
  /// The code has been created but nobody has used it yet.
  pending,
  active,
}

/// One link between two accounts, as stored on this device.
///
/// The same model holds both ends: [side] says whether this account is the
/// one sharing or the one looking. Firestore will hold the pair under
/// `partnerLinks` / `familyLinks`; until then it lives in the encrypted box.
@freezed
abstract class CircleLink with _$CircleLink {
  const factory CircleLink({
    required String id,
    required LinkKind kind,
    required LinkSide side,
    required String code,
    required DateTime createdAt,
    @Default(LinkStatus.pending) LinkStatus status,
    String? peerUid,

    /// What she calls him, so the screen does not just say "partner".
    String? peerName,

    /// Scopes this account shares with the peer. Empty on the viewer side.
    @Default(<ShareScope>{}) Set<ShareScope> shares,
    DateTime? linkedAt,
  }) = _CircleLink;

  const CircleLink._();

  factory CircleLink.fromJson(Map<String, dynamic> json) =>
      _$CircleLinkFromJson(json);

  bool get isActive => status == LinkStatus.active;

  bool get isPending => status == LinkStatus.pending;

  bool get isSharer => side == LinkSide.sharer;

  bool allows(ShareScope scope) => shares.contains(scope);
}
