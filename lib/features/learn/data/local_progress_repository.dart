import '../../../core/services/storage/local_store.dart';
import '../domain/course_progress.dart';

/// Course progress per user, stored on device.
abstract interface class ProgressRepository {
  Map<String, CourseProgress> readAll();

  Future<void> save(CourseProgress progress);
}

class LocalProgressRepository implements ProgressRepository {
  const LocalProgressRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'learn.progress.$_uid';

  @override
  Map<String, CourseProgress> readAll() {
    final items = _store.readJson(_key)?['items'] as List<dynamic>? ?? const [];
    return {
      for (final item in items)
        if (CourseProgress.fromJson(item as Map<String, dynamic>)
            case final progress)
          progress.courseId: progress,
    };
  }

  @override
  Future<void> save(CourseProgress progress) async {
    final all = readAll()..[progress.courseId] = progress;
    await _store.writeJson(_key, {
      'items': [for (final item in all.values) item.toJson()],
    });
  }
}
