import 'contraction.dart';
import 'kick_session.dart';
import 'weight_entry.dart';

/// Kick sessions, contractions and weighings.
///
/// Health data, so local-first and in the encrypted box like the rest of the
/// tracker. Reads are synchronous because the store is already open.
abstract interface class PregnancyRepository {
  List<KickSession> readKickSessions();

  Future<void> saveKickSessions(List<KickSession> sessions);

  List<Contraction> readContractions();

  Future<void> saveContractions(List<Contraction> contractions);

  List<WeightEntry> readWeights();

  Future<void> saveWeights(List<WeightEntry> entries);
}
