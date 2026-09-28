# Her Circle

A women's health, learning and shopping app for Kazakhstan, for users from their teens to 60+. The app is Android only and built with Flutter. It supports Kazakh, Russian (the default) and English.

## Status

| # | Step | State |
|---|------|-------|
| 1 | Project setup, pink/green theme, router, kk/ru/en localization, bottom-nav shell | ✅ |
| 2 | Onboarding, auth, personalization quiz | ✅ |
| 3 | Tracker (cycle), PredictionService, reminders | ✅ |
| 4 | Home feed with mock content | ✅ |
| 5 | Learn: lessons, courses, video, Q&A | ✅ |
| 6 | Shop: catalog, cart, checkout (mock payment) | ✅ |
| 7 | Circle AI chat (mock, then FastAPI `POST /ai/chat`) | ✅ |
| 8 | Partner and family linking | ✅ |
| 9 | Premium, paywall, referrals | ✅ |
| 10 | Pregnancy and menopause tracker modes | ✅ |

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
                                 #   LearnCatalogue (pure filter/sort), bookmarks,
                                 #   library, article, video, course, lesson, quiz,
                                 #   certificate (PDF)
    qa/                          # Question, Answer, Expert, QaCatalogue (pure),
                                 #   list, thread, ask anonymously
    premium/                     # PremiumStatus + gate sheet (real paywall in step 9)
    shop/                        # Product, Seller, Review, Cart, Order, Subscription,
                                 #   ShopCatalogue + ProductRecommender (both pure),
                                 #   PaymentService (mock + Kaspi stub),
                                 #   catalogue, product page, cart, checkout, orders
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

## Learn and Q&A (step 5)

- **Library** with search across all three languages, category chips, type and price filters, and four sort orders. `LearnCatalogue` does the filtering and is unit-tested.
- **Age gating**: the 18+ section is absent for users under 16, and everyone else confirms their age once per visit before it opens.
- **Articles** render their body with the reviewing doctor credited, and a bookmark action.
- **Video lessons** use `video_player` + `chewie`. The player times out and falls back to a retry panel, so a lesson stays readable when the video cannot load.
- **Courses**: modules and lessons with progress, a lesson player, multiple-choice quizzes with explanations and a 70% pass mark, and a PDF certificate on completion.
- **Premium gating** is real: premium items show a lock and open a sheet. Until step 9 builds payment, that sheet carries a clearly labelled demo switch.
- **Expert Q&A**: browse by category, sort by top/new/unanswered, open a thread with the doctor's credentials, upvote, and ask a question — anonymous by default. Premium questions are marked priority.

## The shop (step 6)

- **Catalogue** with search across all three languages, category chips, a price cap, local-brand and sale filters, and five sort orders. `ShopCatalogue` is pure and unit-tested.
- **Timed recommendations**: `ProductRecommender` is shared with the home feed, so "period essentials three days before her period" is implemented once. The shop's own row uses the same rules.
- **Product page**: photo gallery, price with savings, description, bundle contents, seller with the local-brand badge, the linked Learn article, and reviews (real ones, in the language they were written in).
- **Cart** priced against the live catalogue, with quantity limits, free delivery from 15 000 ₸, and a line telling her how much more is needed for it.
- **Checkout** in two steps: address (prefilled from her last order) then payment. Kaspi Pay, card or cash on delivery.
- **Payments** go through `PaymentService`. `MockPaymentService` runs today and declines the standard test card `4000 0000 0000 0002` so the failure path is reachable. `KaspiPaymentService` is a documented stub that reports itself unimplemented rather than pretending to succeed — Kaspi needs a merchant backend and a webhook, which cannot live in the app.
- **Card entry** validates with the Luhn checksum, expiry and CVC as she types. Nothing is stored: the details live in the checkout screen and are dropped when it closes.
- **Orders**: confirmation with a short reference, history, and a tracking timeline. Prices are snapshotted at checkout, so a receipt never changes when the catalogue does.
- **Subscription boxes**: the monthly box is scheduled to arrive three days before her predicted period, the trimester box ships in three deliveries.

## Circle AI (step 7)

- **The chat** opens from the floating button on every main tab. Her questions are pink bubbles, answers green-tinted, and every answer carries the medical disclaimer and the line "this is not a diagnosis".
- **Suggested questions** follow her life stage (`SuggestedQuestion.forProfile`), and the conception starters are never offered to a 10-15 year old.
- **Answers link into the app**: a reply carries lesson and product references, rendered as chips that open Learn and Shop. A reference to something no longer in the catalogue simply disappears.
- **Emergency screening runs on the device**, before anything is sent. `EmergencyDetector` matches red-flag phrases in all three languages (heavy bleeding, severe pain, fainting, pregnancy red flags, self-harm) and shows the urgent-care card with a one-tap call to **103** instead of an answer. Nothing is sent, nothing is charged against her daily quota, and it works with no connection. The backend checks again; either side saying yes is enough.
- **Free tier: 5 questions a day, premium unlimited.** `AiQuota` is pure and unit-tested at the boundary; the counter resets at midnight, and only a delivered answer is charged, so a failed request costs nothing.
- **History stays on the device**, in the encrypted Hive box, capped at 100 messages, and can be cleared from the chat. It is never synced.
- **The backend contract** is `POST /ai/chat` with `{ message, userContext: { ageGroup, stage, cycleDay, pregWeek, language } }`, answering `{ reply, references, emergency }`. The context is deliberately thin: an age band such as `25-34`, a stage, a cycle day — never a birth date or her log.
- **No API key ships in the app.** `HttpAiService` talks only to our FastAPI proxy, which holds the model provider's key and the system prompt, so the safety rules cannot be edited by unpacking the APK. Point a build at it with `--dart-define=AI_BASE_URL=https://…` and `--dart-define=USE_MOCKS=false`.
- **Until that proxy exists**, `MockAiService` answers from `assets/mock/ai_answers.json`: 17 topics plus a fallback, in all three languages, with real lesson and product references. Keywords are stored as stems (`желез`, not `железо`) because they are matched as substrings and both Russian and Kazakh inflect almost every ending.

## Her circle: partner and family (step 8)

- **One model, both ends.** `CircleLink` holds the link whichever side this device is (`LinkSide.sharer` / `viewer`) and whichever kind it is (`partner` / `family`), so the invite, the switches and unlinking are written once. Links live in the encrypted box, keyed per user.
- **Invite codes** are six characters from an alphabet with no look-alikes — no O/0, I/1 or S/5 — and `InviteCode.normalize` maps the ones people still confuse, so `o0i1s5` typed in lower case resolves to a valid code. The invite screen shows the code grouped as `ABC-D2F` for reading aloud, plus a QR carrying a `hercircle://join?code=…` deep link any camera app can open.
- **Nothing is shared without a switch.** `ShareScope` is five separate toggles (life stage, cycle day and phase, mood, pregnancy, symptoms). A partner link starts on three of them; a family link starts on **none**, because spec 5.8 says the daughter's tracker is hers.
- **`PartnerSummaryService` is the only place that decides what crosses a link**, and it is pure and unit-tested. A scope that is off leaves no trace: not a field, and not the support tip either — a withheld low mood cannot leak through "listen rather than advise". With everything off he still gets a tip, and it says nothing about her.
- **"See what your partner sees"** renders that summary from her real data through her real switches, which is the only honest way to show her what she is sharing.
- **Support tips** (`SupportTip.forDay`) pick from what she shares: a shared low mood outranks the cycle phase, the stage outranks the phase, and the fallback is always true.
- **Unlinking** is one tap and a confirmation that says what changes, and it works offline: revoking is best-effort, removal is local.
- **Moms & Daughters** adds the shared lesson list (`FamilyLessons`), which walks a fixed set of age-appropriate categories and drops anything the catalogue marks 18+, so the intimacy section can never appear there. The privacy promise is on the screen, and Profile keeps the invite waiting for a teen who asked for it during onboarding.
- **Pairing needs a backend**, so `MockLinkService` stands in: it validates the code exactly as the server will, refuses her own code and a second link of the same kind, and pairs her with a placeholder peer. The viewer's side is served by `MockPeerSnapshotService` and labelled as sample data in the UI. The linked state is reachable through a clearly marked demo switch until Firestore can flip it for real.

## Premium, the paywall and referrals (step 9)

- **`PremiumMembership` owns all the date arithmetic** and is pure: the seven-day trial (offered once, ever), a plan's length, renewal that extends the period she already paid for rather than restarting it, and a cancellation that keeps the access she bought until it runs out. `hasAccessOn(now)` is the single answer to "does she have premium".
- **Plans**: 2 490 ₸ a month or 19 900 ₸ a year, with the saving computed from the two prices — the badge can never disagree with the maths.
- **Payment reuses the shop**: the same `PaymentService`, the same Luhn-checked card form, the same failure messages, so premium will move to Kaspi when the shop does and the standard decline card exercises the failure path here too. Cash on delivery is not offered for a subscription.
- **The paywall sheet** stays short — the pitch, the trial, and a way to the full premium screen, which carries the five benefits from spec 5.9, both plans and the cancel action.
- **Referrals**: her code is derived from her account id, so it survives a reinstall, and it avoids look-alike characters like the invite codes. One month per friend, capped at twelve, and `ReferralState` tracks what is owed separately from what has been paid out, so a month is never credited twice. A month earned before she subscribes is held and folded into her first payment.
- **Profile** now carries what spec 5.9 asks for: her stage and age, a premium entry that shows the trial countdown, her circle (partner, family, referrals), her learning (saved items, certificates, orders), reminders, settings and sign-out. The life-stage switch offers only the stages that fit her age group, as the quiz does.
- **Billing is still local.** There is no store subscription: `LocalPremiumRepository` keeps the membership in the encrypted box and the demo switch stays for manual testing. Google Play or Kaspi becomes the source of truth when the backend exists, and the shape above does not change.

## Pregnancy, postpartum and menopause modes (step 10)

The tracker mode follows her life stage (spec 5.4), and the cycle calendar is always one tap away — a pregnancy ends, and the stage in a profile is not always the stage she is in today.

- **Pregnancy mode**: the week, the trimester, the baby's size for that week and the countdown to the due date, then the three tools. With no last-period date it asks for one instead of guessing a week.
- **Kick counter**: the count-to-ten session. `KickSession` is pure — it ignores a double tap inside a second, closes itself at ten, and flags a count that has taken more than two hours so the screen can say "call your doctor". It never says what a slow count means.
- **Contraction timer**: one button for start and stop. `ContractionAnalyser` averages the lengths and the gaps over the last hour and recognises the **5-1-1** pattern (five minutes apart, a minute long, for an hour) before prompting her to call. It is tested against the ways it should *not* fire: contractions that are too short, an irregular hour, and a pattern that has not lasted long enough.
- **Weight log**: one entry per day (the latest weighing wins), the gain since the first weighing, the change since the last, and a chart by pregnancy week. Bounds are 30–250 kg, and the card says what is healthy depends on her starting weight and belongs with her doctor.
- **Menopause mode**: the symptom log the spec asks for — the menopause section first (hot flashes, night sweats), then everything else, with average sleep and mood, and the mood chart. `SymptomSummary` counts days over a 30-day window and can narrow to one section of the log sheet. Counts only, no interpretation.
- **Postpartum mode**: weeks since the birth (dated from her last period plus a full term), the daily log, the symptom summary, the mood chart, the weight log and her reminders.
- **The running timers rebuild on a `ticker` provider** rather than a widget timer, so tests override it with an empty stream and drive the counters through their controllers instead of waiting on a clock.

## Quality checks

```bash
flutter analyze        # flutter_lints plus stricter rules in analysis_options.yaml
flutter test
dart format --set-exit-if-changed lib test
```
