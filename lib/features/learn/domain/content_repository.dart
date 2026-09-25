import '../../tracker/domain/pregnancy_status.dart';
import 'content_item.dart';
import 'course.dart';
import 'daily_tip.dart';

/// Read access to the Learn library. Backed by mock JSON until Firestore is
/// connected.
abstract interface class ContentRepository {
  Future<List<ContentItem>> fetchContent();

  Future<List<Course>> fetchCourses();

  Future<List<DailyTip>> fetchTips();

  /// Baby sizes by pregnancy week, for the home status card.
  Future<List<BabySize>> fetchBabySizes();
}
