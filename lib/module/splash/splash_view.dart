import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/constant/storage_key.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/enum/sign_status.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/provider/storage_provider.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final signInType = (await ref.read(secureStorageProvider).read(key: StorageKey.signInType))?.toSignInType();

    await ref.read(appSignInTypeProvider.notifier).update(signInType);
    await ref.read(appEmailProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.email));
    await ref.read(appPasswordProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.password));

    await ref.read(accessTokenProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.accessToken));
    await ref.read(refreshTokenProvider.notifier).update(await ref.read(secureStorageProvider).read(key: StorageKey.refreshToken));

    final authService = ref.read(authServiceProvider);

    try {
      await authService.signCheck();
      if (signInType == SignInType.signIn) {
        ref.read(appSignStatusProvider.notifier).update(SignStatus.signIn);
      } else {
        ref.read(appSignStatusProvider.notifier).update(SignStatus.temporarySignIn);
      }
      ref.read(routerProvider).go(AppRoute.main);
      FlutterNativeSplash.remove();
    } catch (_) {
      ref.read(appSignStatusProvider.notifier).update(SignStatus.signOut);
      ref.read(routerProvider).go(AppRoute.onboard);
      FlutterNativeSplash.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
