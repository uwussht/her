import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/l10n/locale_controller.dart';
import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/app_env.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../premium/presentation/premium_controller.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../tracker/presentation/tracker_providers.dart';
import '../data/local_chat_repository.dart';
import '../data/mock_ai_service.dart';
import '../data/http_ai_service.dart';
import '../domain/ai_context.dart';
import '../domain/ai_quota.dart';
import '../domain/ai_service.dart';
import '../domain/chat_repository.dart';
import '../domain/emergency_detector.dart';
import '../domain/suggested_questions.dart';

part 'ai_providers.g.dart';

/// The assistant backend.
///
/// Mock answers until the FastAPI proxy is deployed; the app never carries a
/// model provider's key either way.
@Riverpod(keepAlive: true)
AiService aiService(Ref ref) {
  if (AppEnv.useMocks) {
    return MockAiService(ref.watch(mockAssetLoaderProvider));
  }
  return HttpAiService(baseUrl: AppEnv.aiBaseUrl);
}

@Riverpod(keepAlive: true)
EmergencyDetector emergencyDetector(Ref ref) => const EmergencyDetector();

@Riverpod(keepAlive: true)
AiQuota aiQuota(Ref ref) => const AiQuota();

@Riverpod(keepAlive: true)
ChatRepository chatRepository(Ref ref) => LocalChatRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

@Riverpod(keepAlive: true)
AiUsageRepository aiUsageRepository(Ref ref) => LocalAiUsageRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

/// How many messages she has sent today.
@Riverpod(keepAlive: true)
class AiUsageController extends _$AiUsageController {
  @override
  AiUsage build() => ref.watch(aiUsageRepositoryProvider).read();

  Future<void> increment({DateTime? now}) async {
    final next = state.increment(now ?? DateTime.now());
    state = next;
    await ref.read(aiUsageRepositoryProvider).save(next);
  }
}

/// Messages left today, or null with premium.
@riverpod
int? aiMessagesLeft(Ref ref) => ref
    .watch(aiQuotaProvider)
    .remaining(
      usage: ref.watch(aiUsageControllerProvider),
      hasPremium: ref.watch(hasPremiumProvider),
      now: DateTime.now(),
    );

/// Whether the next message would go through.
@riverpod
bool canSendAiMessage(Ref ref) => ref
    .watch(aiQuotaProvider)
    .canSend(
      usage: ref.watch(aiUsageControllerProvider),
      hasPremium: ref.watch(hasPremiumProvider),
      now: DateTime.now(),
    );

/// What the assistant is told about her: an age band, a stage, a cycle day.
@riverpod
AiUserContext aiUserContext(Ref ref) => AiUserContext.from(
  profile: ref.watch(userProfileControllerProvider),
  timeline: ref.watch(cycleTimelineProvider),
  language: ref.watch(localeControllerProvider).locale.languageCode,
);

/// Starter questions for her stage, with the adult ones hidden from minors.
@riverpod
List<SuggestedQuestion> aiSuggestedQuestions(Ref ref) {
  final profile = ref.watch(userProfileControllerProvider);
  return SuggestedQuestion.forProfile(
    ageGroup: profile?.ageGroup,
    stage: profile?.lifeStage,
  );
}
