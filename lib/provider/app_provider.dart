import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/constant/storage_key.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/app_mode.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/response/users/get_user_info_response.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/provider/storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_provider.g.dart';

@riverpod
AppMode appMode(AppModeRef ref) {
  return throw UnimplementedError();
}

@riverpod
String baseUrl(BaseUrlRef ref) {
  final appMode = ref.watch(appModeProvider);

  switch (appMode) {
    case AppMode.dev:
      return dotenv.get("DEV_BASE_URL");
    case AppMode.prod:
      return dotenv.get("PROD_BASE_URL");
  }
}

@riverpod
String appKey(AppKeyRef ref) {
  final appMode = ref.watch(appModeProvider);

  switch (appMode) {
    case AppMode.dev:
      return dotenv.get("DEV_APP_KEY");
    case AppMode.prod:
      return dotenv.get("PROD_APP_KEY");
  }
}

@riverpod
String serverStatusKey(ServerStatusKeyRef ref) {
  final appMode = ref.watch(appModeProvider);

  switch (appMode) {
    case AppMode.dev:
      return "DEV_SERVER_STATUS";
    case AppMode.prod:
      return "PROD_SERVER_STATUS";
  }
}

@riverpod
String appStatusKey(AppStatusKeyRef ref) {
  final appMode = ref.watch(appModeProvider);

  switch (appMode) {
    case AppMode.dev:
      return "DEV_APP_STATUS";
    case AppMode.prod:
      return "PROD_APP_STATUS";
  }
}

@Riverpod(keepAlive: true)
class FcmToken extends _$FcmToken {
  @override
  String? build() {
    return null;
  }

  Future<void> update(String? value) async {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class AccessToken extends _$AccessToken {
  @override
  String? build() {
    return null;
  }

  Future<void> update(String? value) async {
    await ref.read(secureStorageProvider).write(key: StorageKey.accessToken, value: value);
    state = value;
  }
}

@Riverpod(keepAlive: true)
class RefreshToken extends _$RefreshToken {
  @override
  String? build() {
    return null;
  }

  Future<void> update(String? value) async {
    await ref.read(secureStorageProvider).write(key: StorageKey.refreshToken, value: value);
    state = value;
  }
}

@Riverpod(keepAlive: true)
class AppEmail extends _$AppEmail {
  @override
  String? build() {
    return null;
  }

  Future<void> update(String? value) async {
    await ref.read(secureStorageProvider).write(key: StorageKey.email, value: value);
    state = value;
  }
}

@Riverpod(keepAlive: true)
class AppPassword extends _$AppPassword {
  @override
  String? build() {
    return null;
  }

  Future<void> update(String? value) async {
    await ref.read(secureStorageProvider).write(key: StorageKey.password, value: value);
    state = value;
  }
}

@Riverpod(keepAlive: true)
class AppSignInType extends _$AppSignInType {
  @override
  SignInType build() {
    return SignInType.defaultSignIn;
  }

  Future<void> update(SignInType value) async {
    await ref.read(secureStorageProvider).write(key: StorageKey.signInType, value: value.toString());
    state = value;
  }
}

@Riverpod(keepAlive: true)
class UserInfo extends _$UserInfo {
  @override
  GetUserInfoData build() {
    return const GetUserInfoData(uuid: '', nickname: '', mbti: MBTI.intp, notification: false);
  }

  Future<void> update(GetUserInfoData value) async {
    state = value;
  }

  Future<void> updateNotification(bool value) async {
    final usersService = ref.read(usersServiceProvider);

    await usersService.updateNotification(
      notification: value,
    );

    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());
  }
}

onSignOut(WidgetRef ref) {
  ref.read(appSignInTypeProvider.notifier).update(SignInType.defaultSignIn);
  ref.read(appEmailProvider.notifier).update(null);
  ref.read(appPasswordProvider.notifier).update(null);

  ref.read(accessTokenProvider.notifier).update(null);
  ref.read(refreshTokenProvider.notifier).update(null);

  ref.read(routerProvider).go(AppRoute.onboard);
}
