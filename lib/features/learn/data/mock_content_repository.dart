import '../../../core/services/mock_asset_loader.dart';
import '../domain/content_item.dart';
import '../domain/content_repository.dart';
import '../domain/course.dart';
import '../../tracker/domain/pregnancy_status.dart';
import '../domain/daily_tip.dart';

/// Learn content from `assets/mock/`.
class MockContentRepository implements ContentRepository {
  const MockContentRepository(this._loader);

  final MockAssetLoader _loader;

  @override
  Future<List<ContentItem>> fetchContent() async => [
    for (final json in await _loader.loadList('content'))
      ContentItem.fromJson(json),
  ];

  @override
  Future<List<Course>> fetchCourses() async => [
    for (final json in await _loader.loadList('courses')) Course.fromJson(json),
  ];

  @override
  Future<List<DailyTip>> fetchTips() async => [
    for (final json in await _loader.loadList('tips')) DailyTip.fromJson(json),
  ];

  @override
  Future<List<BabySize>> fetchBabySizes() async => [
    for (final json in await _loader.loadList('baby_sizes'))
      BabySize.fromJson(json),
  ];
}
