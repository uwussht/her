import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/l10n/localized_text.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/services/storage/local_store.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/domain/content_item.dart';
import '../../premium/presentation/premium_controller.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../data/local_qa_store.dart';
import '../domain/qa_state.dart';
import '../domain/question.dart';

part 'qa_controller.g.dart';

const _uuid = Uuid();

@Riverpod(keepAlive: true)
QaLocalStore qaLocalStore(Ref ref) {
  final uid = ref.watch(currentUserProvider)?.uid;
  return LocalQaStore(ref.watch(localStoreProvider), uid ?? 'guest');
}

@Riverpod(keepAlive: true)
QaCatalogue qaCatalogue(Ref ref) => const QaCatalogue();

/// Her questions and upvotes.
@Riverpod(keepAlive: true)
class QaController extends _$QaController {
  @override
  QaLocalState build() {
    final store = ref.watch(qaLocalStoreProvider);
    return QaLocalState(
      myQuestions: store.readMyQuestions(),
      upvotedQuestionIds: store.readUpvotes(),
    );
  }

  /// Adds a question. Premium askers are marked priority.
  Future<Question> ask({
    required String text,
    required ContentCategory category,
    required bool anonymous,
  }) async {
    final locale = ref.read(localeControllerProvider).locale.languageCode;
    final question = Question(
      id: 'mine.${_uuid.v4()}',
      // Only the language she wrote in: nothing is machine-translated.
      body: LocalizedText({locale: text.trim()}),
      category: category,
      askedAt: DateTime.now(),
      askedBy: anonymous ? null : ref.read(currentUserProvider)?.displayName,
      priority: ref.read(hasPremiumProvider),
    );
    final questions = [question, ...state.myQuestions];
    state = state.copyWith(myQuestions: questions);
    await ref.read(qaLocalStoreProvider).saveMyQuestions(questions);
    return question;
  }

  /// Returns true when the upvote was added.
  Future<bool> toggleUpvote(String questionId) async {
    final next = {...state.upvotedQuestionIds};
    final added = next.add(questionId);
    if (!added) next.remove(questionId);
    state = state.copyWith(upvotedQuestionIds: next);
    await ref.read(qaLocalStoreProvider).saveUpvotes(next);
    return added;
  }

  bool hasUpvoted(String questionId) =>
      state.upvotedQuestionIds.contains(questionId);
}

/// Q&A list filters.
@riverpod
class QaFilterController extends _$QaFilterController {
  @override
  ({QaSort sort, ContentCategory? category, bool mineOnly}) build() =>
      (sort: QaSort.top, category: null, mineOnly: false);

  void setSort(QaSort sort) =>
      state = (sort: sort, category: state.category, mineOnly: state.mineOnly);

  void setCategory(ContentCategory? category) =>
      state = (sort: state.sort, category: category, mineOnly: state.mineOnly);

  void toggleMineOnly() => state = (
    sort: state.sort,
    category: state.category,
    mineOnly: !state.mineOnly,
  );
}

/// The Q&A list: the mock threads plus her own questions.
@riverpod
List<Question> qaResults(Ref ref) {
  final filter = ref.watch(qaFilterControllerProvider);
  final local = ref.watch(qaControllerProvider);
  final remote = ref.watch(questionsProvider).value ?? const [];
  final profile = ref.watch(userProfileControllerProvider);

  return ref
      .watch(qaCatalogueProvider)
      .apply(
        questions: filter.mineOnly
            ? local.myQuestions
            : [...local.myQuestions, ...remote],
        sort: filter.sort,
        category: filter.category,
        hideAdultOnly: profile?.ageGroup.isUnder16 ?? false,
        upvoted: local.upvotedQuestionIds,
      );
}

@riverpod
Question? questionById(Ref ref, String id) {
  for (final question in ref.watch(qaResultsProvider)) {
    if (question.id == id) return question;
  }
  // Fall back to the full list when a filter hides it.
  final local = ref.watch(qaControllerProvider);
  final remote = ref.watch(questionsProvider).value ?? const [];
  for (final question in [...local.myQuestions, ...remote]) {
    if (question.id == id) return question;
  }
  return null;
}
