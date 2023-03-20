import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/widget/index.dart';
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

  if (email.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        return ODAlertModal(
          text: "이메일을 입력해주세요.",
          onTap: () => context.pop(),
        );
      },
    );
    return;
  }
  if (password.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        return ODAlertModal(
          text: "비밀번호를 입력해주세요.",
          onTap: () => context.pop(),
        );
      },
    );
    return;
  }

  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.watch(authServiceProvider);
    final usersService = ref.read(usersServiceProvider);

    final data = await authService.signIn(
      email: email,
      password: password,
    );

    ref.read(appSignInTypeProvider.notifier).update(SignInType.defaultSignIn);
    ref.read(appEmailProvider.notifier).update(email);
    ref.read(appPasswordProvider.notifier).update(password);

    ref.read(accessTokenProvider.notifier).update(data.accessToken);
    ref.read(refreshTokenProvider.notifier).update(data.refreshToken);

    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());

    ref.read(routerProvider).go(AppRoute.main);

    loading.update(false);
  } on String catch (errorCode) {
    loading.update(false);

    late String errorText;

    switch (errorCode) {
      case "bad_request":
        errorText = "존재하지 않은 이메일 입니다.";
        break;
      case "bad_password":
        errorText = "비밀번호가 일치하지 않습니다.";
        break;
      default:
        errorText = "알 수 없는 에러가 발생헀습니다.";
        break;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ODAlertModal(
          text: errorText,
          onTap: () => context.pop(),
        );
      },
    );
  }
}
