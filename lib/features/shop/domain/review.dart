import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

/// A customer review. Written by a person, so it is not translated: it is
/// shown in whatever language she wrote it in.
@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required String productId,
    required String author,
    required int rating,
    required String text,
    required DateTime createdAt,

    /// Language tag of [text], so the UI can mark a foreign-language review.
    @Default('ru') String language,

    /// She bought it through Her Circle.
    @Default(true) bool verifiedPurchase,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

abstract interface class ReviewRepository {
  Future<List<Review>> fetchReviews();
}
