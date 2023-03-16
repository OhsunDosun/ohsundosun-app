import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class Email extends _$Email {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
class Password extends _$Password {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

Future<void> onSignIn(
  BuildContext context,
  WidgetRef ref, {
  required String email,
  required String password,
}) async {
  FocusScope.of(context).unfocus();

  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.watch(authServiceProvider);

    final data = await authService.signIn(
      email: email,
      password: password,
    );

    ref.read(appSignInTypeProvider.notifier).update(SignInType.defaultSignIn);
    ref.read(appEmailProvider.notifier).update(email);
    ref.read(appPasswordProvider.notifier).update(password);

    ref.read(accessTokenProvider.notifier).update(data.accessToken);
    ref.read(refreshTokenProvider.notifier).update(data.refreshToken);

    ref.read(routerProvider).go(AppRoute.main);

    loading.update(false);
  } catch (e) {
    loading.update(false);
  }
}
