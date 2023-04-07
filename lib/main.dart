import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/constant/storage_key.dart';
import 'package:ohsundosun/firebase_options.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/provider/storage_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/util/logger.dart';
import 'package:ohsundosun/util/mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 가로 모드 세팅
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // 스플래쉬 화면 유지
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // .env 가져옴
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: await currentPlatform(),
  );

  // 에러 시 FirebaseCrashlytics 로 에러 값 보냄
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  final localStorage = await SharedPreferences.getInstance();
  if (localStorage.getBool(StorageKey.isFirstLaunch) ?? true) {
    await secureStorage.deleteAll();
    await localStorage.setBool(StorageKey.isFirstLaunch, false);
  }

  return runApp(
    // 프로바이더 세팅
    ProviderScope(
      overrides: [
        appModeProvider.overrideWithValue(await getAppMode()),
        secureStorageProvider.overrideWithValue(secureStorage),
        localStorageProvider.overrideWithValue(localStorage),
      ],
      observers: [
        ProviderLogger(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // 반응형 화면을 위해 ScreenUtilInit 세팅
    return ScreenUtilInit(
      designSize: const Size(375, 765),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: ColorStyles.white,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
