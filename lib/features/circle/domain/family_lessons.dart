import '../../learn/domain/content_item.dart';

/// The lessons a mother and her daughter get together (spec 5.8).
///
/// Pure, so the age-appropriateness rule is a unit test rather than a hope:
/// the 18+ section can never appear here, whichever of them is looking.
class FamilyLessons {
  const FamilyLessons();

  /// Categories worth reading together, most relevant first.
  static const List<ContentCategory> categories = [
    ContentCategory.myBody,
    ContentCategory.cycleHealth,
    ContentCategory.mentalHealth,
    ContentCategory.nutrition,
  ];

  static const int defaultLimit = 8;

  List<ContentItem> select(
    List<ContentItem> items, {
    int limit = defaultLimit,
  }) {
    final picked = <ContentItem>[];
    for (final category in categories) {
      for (final item in items) {
        // Belt and braces: the loop above only walks safe categories, and
        // this drops anything the catalogue marks 18+ anyway.
        if (item.isAdultOnly) continue;
        if (item.category != category) continue;
        if (item.type == ContentType.course) continue;
        picked.add(item);
      }
    }
    return picked.length <= limit ? picked : picked.sublist(0, limit);
  }
}
