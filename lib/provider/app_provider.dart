import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ohsundosun/constant/storage_key.dart';
import 'package:ohsundosun/enum/app_mode.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/enum/sign_status.dart';
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
  SignInType? build() {
    return null;
  }

  Future<void> update(SignInType? value) async {
    await ref.read(secureStorageProvider).write(key: StorageKey.signInType, value: value?.toString());
    state = value;
  }
}

@Riverpod(keepAlive: true)
class AppSignStatus extends _$AppSignStatus {
  @override
  SignStatus build() {
    return SignStatus.signOut;
  }

  void update(SignStatus value) {
    state = value;
  }
}
