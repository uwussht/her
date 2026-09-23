# Her Circle

A women's health, learning and shopping app for Kazakhstan, for users from their teens to 60+. The app is Android only and built with Flutter. It supports Kazakh, Russian (the default) and English.

## Status

| # | Step | State |
|---|------|-------|
| 1 | Project setup, pink/green theme, router, kk/ru/en localization, bottom-nav shell | ✅ |
| 2 | Onboarding, auth, personalization quiz | ✅ |
| 3 | Tracker (cycle), PredictionService, reminders | ⏳ |
| 4 | Home feed with mock content | ⏳ |
| 5 | Learn: lessons, courses, video, Q&A | ⏳ |
| 6 | Shop: catalog, cart, checkout (mock payment) | ⏳ |
| 7 | Circle AI chat (mock, then FastAPI `POST /ai/chat`) | ⏳ |
| 8 | Partner and family linking | ⏳ |
| 9 | Premium, paywall, referrals | ⏳ |
| 10 | Pregnancy and menopause tracker modes | ⏳ |

## Getting started

```bash
flutter pub get                               # also generates the l10n classes
dart run build_runner build -d                # Riverpod, freezed and json codegen
flutter run                                   # mocks on, Firebase off
```

Generated `*.g.dart` files and `lib/core/l10n/generated/` are committed, so a fresh clone compiles before codegen runs. Re-run `build_runner` after you change any annotated provider or model.

### Mock sign-in (default, `USE_MOCKS=true`)

| Method | How to sign in |
|--------|----------------|
| Phone | Any KZ mobile number (`7XX XXX XX XX`). The SMS code is always **123456**. |
| Email | Any address. Sign-up needs 8+ characters. The password `wrong-password` fails, so you can see the error state. |
| Google | Signs in a demo account. |

The session survives restarts. To see onboarding again, clear the app's data.

### Build-time configuration (`--dart-define`)

| Key | Default | Purpose |
|-----|---------|---------|
| `USE_MOCKS` | `true` | Use the JSON in `assets/mock/` instead of Firebase and the AI proxy |
| `FIREBASE_ENABLED` | `false` | Call `Firebase.initializeApp()` at startup |
| `AI_BASE_URL` | `http://10.0.2.2:8000` | FastAPI proxy base URL. The app never holds API keys. |

### Connecting Firebase

1. Add `android/app/google-services.json` for the `kz.hercircle.app` application ID. The Gradle Google Services plugin turns on automatically when this file exists.
2. In the Firebase console, turn on the Phone, Email/Password and Google sign-in providers. Add the app's SHA-1 and SHA-256 fingerprints so phone auth and Google sign-in work.
3. Run with `--dart-define=FIREBASE_ENABLED=true --dart-define=USE_MOCKS=false`.

## Architecture

The code uses feature-first clean architecture. Each feature is split into `data/` (sources, DTOs, repository implementations), `domain/` (entities, repository interfaces, services) and `presentation/` (screens, widgets, controllers). Step 1 only needs `presentation/`. The other layers arrive with each feature.

```
lib/
  main.dart                      # bootstrap() then runApp(ProviderScope)
  app.dart                       # MaterialApp.router: theme, locale, router
  core/
    theme/                       # app_colors, app_text_styles, app_theme, app_dimens, theme_mode_controller
    router/                      # app_routes, app_router (go_router + StatefulShellRoute), app_shell, not_found_screen
    l10n/                        # arb/ (ru template, kk, en), generated/, app_locales, locale_controller
    services/                    # bootstrap, storage/ (preferences, encrypted LocalStore)
    widgets/                     # AppCard, OptionCard, LoadingButton, TitledPageLayout, StepProgress,
                                 # PageDots, BrandMark, IconBubble, PillBadge, SectionHeader, DisclaimerCard
    utils/                       # app_env, context_extensions, greeting_period
  features/
    onboarding/                  # splash, intro, language, quiz (4 steps), Moms & Daughters offer,
                                 # OnboardingStatus → router redirect
    auth/                        # AuthRepository (mock + Firebase: phone OTP, email, Google), screens
    profile/                     # UserProfile (freezed), personalization enums, local repository
    home/ learn/ tracker/ shop/ ai_assistant/
    (qa/ partner/ family/ premium/ are added in their steps)
assets/
  google_fonts/                  # bundled Nunito (OFL), covers Kazakh Cyrillic and ₸
  mock/                          # mock JSON until Firebase is connected
```

### Conventions

- **Colors:** literals appear only in `core/theme/app_colors.dart`. Widgets use `context.colors` (the `ColorScheme`) or `context.palette` (the `AppPalette` extension for success, warning, period, fertile, ovulation and similar roles). Pink is for the brand and cycle elements. Green is for health, success, fertility and "Add to cart".
- **Strings:** all user-facing text comes from the ARB files through `context.l10n`. Russian (`app_ru.arb`) is the template. Add every key to all three ARB files.
- **Spacing and radii:** use `AppSpacing`, `AppRadius` and `AppSizes`. Cards use radius 16, bottom sheets 24, and buttons are pill-shaped.
- **State:** use Riverpod with `riverpod_generator` (`@riverpod`). Anything loaded asynchronously before the first frame is injected in `bootstrap()` through provider overrides.
- **Navigation:** navigate only with the `AppRoutes` constants. Tabs are `StatefulShellRoute` branches, so each tab keeps its own stack. Full-screen flows go on the root navigator.
- **Navigation guard:** `onboardingRedirect` (in `core/router/`) sends each user to the onboarding step they haven't finished: intro, language, auth, quiz, then the Moms & Daughters offer for users under 16. It also keeps users who have finished onboarding out of those screens.
- **Privacy:** personal and health data (the profile, and tracker data from step 3) lives in an AES-encrypted Hive box. Its key is stored in the Android Keystore through flutter_secure_storage. Android backup and device transfer are turned off (`data_extraction_rules.xml`).

## Quality checks

```bash
flutter analyze        # flutter_lints plus stricter rules in analysis_options.yaml
flutter test
dart format --set-exit-if-changed lib test
```
