# Her Circle

A women's health, learning and shopping app for Kazakhstan, for users from their teens to 60+. The app is Android only and built with Flutter. It supports Kazakh, Russian (the default) and English.

## Status

| # | Step | State |
|---|------|-------|
| 1 | Project setup, pink/green theme, router, kk/ru/en localization, bottom-nav shell | ✅ |
| 2 | Onboarding, auth, personalization quiz | ✅ |
| 3 | Tracker (cycle), PredictionService, reminders | ✅ |
| 4 | Home feed with mock content | ✅ |
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
    tracker/                     # domain: Cycle, DailyLog, PredictionService, CycleTimeline,
                                 #   Reminder + ReminderScheduler, Vaccination + schedule
                                 # data: encrypted local repositories, doctor-report PDF
                                 # presentation: calendar, daily log sheet, mood chart,
                                 #   reminders and vaccinations screens
    home/                        # FeedService (pure ranking), HomeFeed, home screen
    learn/                       # ContentItem, Course, CourseProgress, DailyTip,
                                 #   mock repository, content cards
    qa/                          # Question, Answer, Expert, question card
    shop/                        # Product, Seller, product card
    ai_assistant/
    (qa/ partner/ family/ premium/ are added in their steps)
assets/
  google_fonts/                  # bundled Nunito (OFL), covers Kazakh Cyrillic and ₸
  mock/                          # content, courses, tips, baby_sizes, questions,
                                 # experts, products, sellers — all kk/ru/en
```

### Conventions

- **Colors:** literals appear only in `core/theme/app_colors.dart`. Widgets use `context.colors` (the `ColorScheme`) or `context.palette` (the `AppPalette` extension for success, warning, period, fertile, ovulation and similar roles). Pink is for the brand and cycle elements. Green is for health, success, fertility and "Add to cart".
- **Strings:** all user-facing text comes from the ARB files through `context.l10n`. Russian (`app_ru.arb`) is the template. Add every key to all three ARB files.
- **Spacing and radii:** use `AppSpacing`, `AppRadius` and `AppSizes`. Cards use radius 16, bottom sheets 24, and buttons are pill-shaped.
- **State:** use Riverpod with `riverpod_generator` (`@riverpod`). Anything loaded asynchronously before the first frame is injected in `bootstrap()` through provider overrides.
- **Navigation:** navigate only with the `AppRoutes` constants. Tabs are `StatefulShellRoute` branches, so each tab keeps its own stack. Full-screen flows go on the root navigator.
- **Navigation guard:** `onboardingRedirect` (in `core/router/`) sends each user to the onboarding step they haven't finished: intro, language, auth, quiz, then the Moms & Daughters offer for users under 16. It also keeps users who have finished onboarding out of those screens.
- **Predictions:** all cycle maths lives in `PredictionService` (pure, no Flutter or storage imports) so the algorithm can be improved or moved server-side on its own. `CycleTimeline` is the read model the UI works from. Date arithmetic goes through `core/utils/date_utils.dart`, which counts whole calendar days and so is immune to daylight-saving shifts.
- **Reminders:** `ReminderScheduler` turns reminders plus the forecast into a list of notification times and is pure, so the timing rules are unit-tested. `ReminderSync` wraps the app and reschedules whenever the reminders, forecast, vaccinations or language change. Cycle, pill, doctor and vaccination reminders use a separate "sensitive" channel and respect "hide content".
- **Privacy:** personal and health data (the profile, and tracker data from step 3) lives in an AES-encrypted Hive box. Its key is stored in the Android Keystore through flutter_secure_storage. Android backup and device transfer are turned off (`data_extraction_rules.xml`).

## The tracker (step 3)

Cycle mode is built. Pregnancy, postpartum and menopause modes show a placeholder and offer cycle mode until step 10.

- **Calendar** with logged periods, and predicted period, fertile and ovulation days for the next six cycles. Predictions are outlined rather than filled, so a forecast never looks like a fact.
- **Daily log** per day: flow, mood (5-point emoji scale), energy, sleep, symptoms (physical, emotional, menopause) and a note. Clearing every field deletes the entry.
- **Predictions** from the last 3–6 cycles, with a confidence indicator (estimate / low / medium / high) based on how many cycles there are and how much they vary. Gaps outside 15–60 days are treated as missed logging and left out of the averages. Ovulation is placed a 14-day luteal phase before the next period, so the fertile window moves with cycle length.
- **Mood charts** over a week or a month.
- **Reminders** via local notifications: period coming (1–7 days ahead), fertile window, pill, water, doctor visits and vaccinations. Cycle reminders are scheduled three cycles ahead so they keep firing if the app is not opened.
- **Vaccinations** suggested by age and life stage (HPV for teens, Tdap in pregnancy, measles/rubella when trying to conceive, shingles and pneumococcal at 45+), every entry editable. Live vaccines are withheld during pregnancy. The list is explicitly a reference, not a prescription.
- **Doctor report** exported as a PDF (cycles, summary and recent logs) built on device and shared through the Android share sheet.

## The home feed (step 4)

The feed is assembled by `FeedService`, which is pure and unit-tested, so the ranking rules can move server-side later without touching the UI.

- **Status card**: pregnancy week with the baby's size and a countdown, or the cycle card from step 3, or a prompt to start tracking.
- **For you**: ranked by life stage (strongest), matching interests, and — for pregnancy — how close a week-by-week lesson is to her current week. Popularity breaks ties, and free material gets a small nudge so the feed is useful without premium.
- **Tip of the day**: matched to today's cycle phase or life stage, and stable for the whole day.
- **Continue course**: an unfinished course she has started wins over a better-matching new one, and a finished course is never offered again.
- **Shop offers**: timed to the forecast. Period essentials appear three days before the predicted period, fertility products during the fertile window when she is trying to conceive, and pregnancy or menopause products when that is her stage.
- **Trending Q&A**: answered questions first, then by upvotes, with the verified-doctor badge.

Age gating runs through the whole feed: users under 16 never see 18+ content or intimate-health products.

### Content data

Content lives in `assets/mock/` in the shape Firestore will hold, with every string as `{"ru": …, "kk": …, "en": …}` and resolved through `LocalizedText`. `test/features/home/mock_data_test.dart` guards that data: every item must parse, carry all three languages, and reference a real course, expert, seller or product.

Mock content ships without cover images, so cards render a tinted panel with the category icon. Real images load through `cached_network_image` and fall back to the same panel.

## Quality checks

```bash
flutter analyze        # flutter_lints plus stricter rules in analysis_options.yaml
flutter test
dart format --set-exit-if-changed lib test
```
