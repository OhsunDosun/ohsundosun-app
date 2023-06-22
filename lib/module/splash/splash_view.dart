import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/constant/storage_key.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/common/status.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/provider/storage_provider.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:version/version.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildContext = useState(context);

    trySignIn() async {
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
        FlutterNativeSplash.remove();
        ref.read(routerProvider).go(AppRoute.main);
      } catch (_) {
        FlutterNativeSplash.remove();
        ref.read(routerProvider).go(AppRoute.onboard);
      }
    }

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

      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        minimumFetchInterval: const Duration(seconds: 10),
        fetchTimeout: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate();

      final packageInfo = await PackageInfo.fromPlatform();

      final serverStatus = ServerStatus.fromJson(jsonDecode(remoteConfig.getString(ref.read(serverStatusKeyProvider))));

      if (serverStatus.open) {
        final appStatus = AppStatus.fromJson(jsonDecode(remoteConfig.getString(ref.read(appStatusKeyProvider))));

        final currentVersion = Version.parse(packageInfo.version);

        final latestVersion = Version.parse(appStatus.latestVersion);
        final forceVersion = Version.parse(appStatus.forceVersion);

        final isUpdate = latestVersion > currentVersion;

        if (!isUpdate) {
          await trySignIn();
        } else {
          final isForce = forceVersion > currentVersion;

          FlutterNativeSplash.remove();

          await showDialog(
            barrierDismissible: false,
            context: buildContext.value,
            builder: (BuildContext context) {
              return ODConfirmModal(
                text: "새로운 버전이 출시되었습니다.\n${isForce ? "업데이트 후 앱 사용이 가능합니다." : "업데이트 하시겠습니까?"}",
                cancelText: isForce ? "종료" : "나중에",
                onCancelTap: () async {
                  if (isForce) {
                    exit(0);
                  } else {
                    context.pop();
                  }
                },
                okText: "업데이트",
                onOkTap: () async {
                  await StoreRedirect.redirect(
                    androidAppId: "com.ohsundosun.ohsundosun",
                    iOSAppId: "1634542335",
                  );
                },
              );
            },
          );

          await trySignIn();
        }
      } else {
        FlutterNativeSplash.remove();

        await showDialog(
          barrierDismissible: false,
          context: buildContext.value,
          builder: (context) {
            return ODAlertModal(
              text: "서비스가 종료되었습니다.\n\nOhsunDosun을\n이용해주셔서 감사합니다.",
              onTap: () => exit(0),
            );
          },
        );
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
