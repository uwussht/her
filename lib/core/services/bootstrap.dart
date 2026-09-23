import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_env.dart';
import 'storage/encrypted_box_opener.dart';
import 'storage/local_store.dart';
import 'storage/preferences_service.dart';

/// Runs one-time async setup before the first frame and returns the
/// provider overrides that setup produced.
Future<List<Override>> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Nunito is bundled in assets/google_fonts/, so never hit the network.
  GoogleFonts.config.allowRuntimeFetching = false;

  if (AppEnv.firebaseEnabled) {
    try {
      await Firebase.initializeApp();
    } on Exception catch (error, stack) {
      // The app is local-first, so a missing Firebase config must not
      // block startup.
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stack,
          library: 'bootstrap',
          context: ErrorDescription('while initialising Firebase'),
        ),
      );
    }
  }

  final prefs = await SharedPreferences.getInstance();
  final localStore = await EncryptedBoxOpener.open();

  if (kDebugMode) {
    debugPrint('Her Circle bootstrap: mocks=${AppEnv.useMocks}');
  }

  return [
    sharedPreferencesProvider.overrideWithValue(prefs),
    localStoreProvider.overrideWithValue(localStore),
  ];
}
