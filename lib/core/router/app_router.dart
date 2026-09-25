import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/ai_assistant/presentation/ai_assistant_screen.dart';
import '../../features/auth/presentation/auth_welcome_screen.dart';
import '../../features/auth/presentation/email_auth_screen.dart';
import '../../features/auth/presentation/otp_screen.dart';
import '../../features/auth/presentation/phone_auth_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/learn/presentation/content_detail_placeholder.dart';
import '../../features/learn/presentation/learn_screen.dart';
import '../../features/onboarding/domain/onboarding_status.dart';
import '../../features/onboarding/presentation/family_offer_screen.dart';
import '../../features/onboarding/presentation/intro_screen.dart';
import '../../features/onboarding/presentation/language_screen.dart';
import '../../features/onboarding/presentation/onboarding_controller.dart';
import '../../features/onboarding/presentation/quiz/quiz_screen.dart';
import '../../features/onboarding/presentation/splash_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/settings_screen.dart';
import '../../features/shop/presentation/shop_screen.dart';
import '../../features/tracker/presentation/reminders_screen.dart';
import '../../features/tracker/presentation/tracker_screen.dart';
import '../../features/tracker/presentation/vaccinations_screen.dart';
import 'app_routes.dart';
import 'app_shell.dart';
import 'not_found_screen.dart';
import 'onboarding_redirect.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  // Re-run redirects whenever the onboarding status changes (sign-in,
  // sign-out, quiz saved) without rebuilding the router.
  final status = ValueNotifier<OnboardingStatus>(
    ref.read(onboardingStatusProvider),
  );
  ref
    ..listen(onboardingStatusProvider, (_, next) => status.value = next)
    ..onDispose(status.dispose);

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: status,
    redirect: (context, state) =>
        onboardingRedirect(state.matchedLocation, status.value),
    errorBuilder: (context, state) => const NotFoundScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.intro,
        pageBuilder: (context, state) => _fade(state, const IntroScreen()),
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthWelcomeScreen(),
        routes: [
          GoRoute(
            path: 'phone',
            builder: (context, state) => const PhoneAuthScreen(),
          ),
          GoRoute(
            path: 'otp',
            redirect: (context, state) =>
                state.extra is OtpArgs ? null : AppRoutes.authPhone,
            builder: (context, state) =>
                OtpScreen(args: state.extra! as OtpArgs),
          ),
          GoRoute(
            path: 'email',
            builder: (context, state) => const EmailAuthScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.quiz,
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: AppRoutes.familyOffer,
        builder: (context, state) => const FamilyOfferScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          _tab(AppRoutes.home, const HomeScreen()),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.learn,
                pageBuilder: (context, state) => NoTransitionPage<void>(
                  key: state.pageKey,
                  child: const LearnScreen(),
                ),
                routes: [
                  // Placeholder until step 5 builds the detail screen.
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => ContentDetailPlaceholder(
                      id: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _tab(AppRoutes.tracker, const TrackerScreen()),
          _tab(AppRoutes.shop, const ShopScreen()),
          _tab(AppRoutes.profile, const ProfileScreen()),
        ],
      ),
      GoRoute(
        path: AppRoutes.reminders,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const RemindersScreen(),
        routes: [
          GoRoute(
            path: 'vaccinations',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const VaccinationsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.settings,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.aiAssistant,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          fullscreenDialog: true,
          child: const AiAssistantScreen(),
        ),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

Page<void> _fade(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, _, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

StatefulShellBranch _tab(String path, Widget screen) {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: path,
        pageBuilder: (context, state) =>
            NoTransitionPage<void>(key: state.pageKey, child: screen),
      ),
    ],
  );
}
