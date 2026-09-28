import 'circle_link.dart';
import 'partner_summary.dart';

/// What the viewer's device is told about the other person.
///
/// On the sharer's device the summary is built locally from her own data (see
/// [PartnerSummaryService]); on the viewer's device it has to come from the
/// backend, which applies her scopes server-side. Only what she shares ever
/// leaves her phone.
abstract interface class PeerSnapshotService {
  Future<PartnerSummary> fetch(CircleLink link);
}
