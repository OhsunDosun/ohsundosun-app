import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/constant/storage_key.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/provider/storage_provider.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    init() async {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      await ref.read(fcmTokenProvider.notifier).update(await FirebaseMessaging.instance.getToken());

      final signInType = (await ref.read(secureStorageProvider).read(key: StorageKey.signInType))?.toSignInType();

      await ref.read(appSignInTypeProvider.notifier).update(signInType ?? SignInType.defaultSignIn);
      await ref.read(appEmailProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.email));
      await ref.read(appPasswordProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.password));

      await ref.read(accessTokenProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.accessToken));
      await ref.read(refreshTokenProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.refreshToken));

      final authService = ref.read(authServiceProvider);
      final usersService = ref.read(usersServiceProvider);

      FirebaseMessaging.instance.onTokenRefresh.listen(
        (fcmToken) {
          debugPrint("onTokenRefresh: $fcmToken");
        },
      );

      try {
        await authService.signCheck();
        ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());
        ref.read(routerProvider).go(AppRoute.main);
        FlutterNativeSplash.remove();
      } catch (_) {
        FlutterNativeSplash.remove();
      }
    }

    useEffect(() {
      init();
      return null;
    }, []);

    return Scaffold(
      body: Container(),
    );
  }
}
