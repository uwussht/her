import '../../../core/services/mock_asset_loader.dart';
import '../domain/review.dart';

class MockReviewRepository implements ReviewRepository {
  const MockReviewRepository(this._loader);

  final MockAssetLoader _loader;

  @override
  Future<List<Review>> fetchReviews() async => [
    for (final json in await _loader.loadList('reviews')) Review.fromJson(json),
  ];
}
