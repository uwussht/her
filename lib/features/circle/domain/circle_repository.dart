import 'circle_link.dart';

/// The links this device knows about.
///
/// Local-first, like the tracker: a link is stored in the encrypted box and
/// mirrored to Firestore once the backend exists.
abstract interface class CircleRepository {
  List<CircleLink> read();

  Future<void> save(List<CircleLink> links);
}

/// Why redeeming a code failed.
enum LinkFailureReason {
  /// Not six characters from the invite alphabet.
  malformed,

  /// No such invite, or it has already been used.
  unknown,

  /// Her own code, entered on her own device.
  ownCode,

  /// She already has a link of this kind.
  alreadyLinked,
  network,
}

class LinkFailure implements Exception {
  const LinkFailure(this.reason);

  final LinkFailureReason reason;

  @override
  String toString() => 'LinkFailure($reason)';
}

/// The other end of the link.
///
/// Redeeming a code needs both devices, so it is a backend call. The mock
/// stands in until Firestore is connected.
abstract interface class LinkService {
  /// Claims [code] for this account and returns the viewer's side of the
  /// link. Throws [LinkFailure].
  Future<CircleLink> redeem({
    required String code,
    required LinkKind kind,
    required List<CircleLink> existing,
  });

  /// Tells the backend the link is over. Never throws: unlinking must always
  /// succeed locally, even offline.
  Future<void> revoke(CircleLink link);
}
