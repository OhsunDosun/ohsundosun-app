import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ohsundosun/enum/app_mode.dart';
import 'package:ohsundosun/util/mode.dart';

Future<FirebaseOptions> currentPlatform() async {
  final appMode = await getAppMode();

  if (kIsWeb) {
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured for web - '
      'you can reconfigure this by running the FlutterFire CLI again.',
    );
  }

  final messagingSenderId = dotenv.get("MESSAGING_SENDER_ID");
  final projectId = dotenv.get("PROJECT_ID");
  final storageBucket = dotenv.get("STORAGE_BUCKET");

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      final apiKey = dotenv.get("ANDROID_API_KEY");
      switch (appMode) {
        case AppMode.dev:
          return FirebaseOptions(
            apiKey: apiKey,
            appId: dotenv.get("DEV_ANDROID_APP_ID"),
            messagingSenderId: messagingSenderId,
            projectId: projectId,
            storageBucket: storageBucket,
          );
        case AppMode.prod:
          return FirebaseOptions(
            apiKey: apiKey,
            appId: dotenv.get("PROD_ANDROID_APP_ID"),
            messagingSenderId: messagingSenderId,
            projectId: projectId,
            storageBucket: storageBucket,
          );
      }
    case TargetPlatform.iOS:
      final apiKey = dotenv.get("IOS_API_KEY");
      switch (appMode) {
        case AppMode.dev:
          return FirebaseOptions(
            apiKey: apiKey,
            appId: dotenv.get("DEV_IOS_APP_ID"),
            messagingSenderId: messagingSenderId,
            projectId: projectId,
            storageBucket: storageBucket,
            iosClientId: dotenv.get("DEV_IOS_CLIENT_ID"),
            iosBundleId: dotenv.get("DEV_IOS_BUNDLE_ID"),
          );
        case AppMode.prod:
          return FirebaseOptions(
            apiKey: apiKey,
            appId: dotenv.get("PROD_IOS_APP_ID"),
            messagingSenderId: messagingSenderId,
            projectId: projectId,
            storageBucket: storageBucket,
            iosClientId: dotenv.get("PROD_IOS_CLIENT_ID"),
            iosBundleId: dotenv.get("PROD_IOS_BUNDLE_ID"),
          );
      }
    case TargetPlatform.macOS:
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for macos - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    case TargetPlatform.windows:
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for windows - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    case TargetPlatform.linux:
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for linux - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    default:
      throw UnsupportedError(
        'DefaultFirebaseOptions are not supported for this platform.',
      );
  }
}
