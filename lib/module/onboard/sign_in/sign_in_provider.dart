import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/util/valid.dart';
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
String? emailError(EmailErrorRef ref) {
  final email = ref.watch(emailProvider);

  if (email.isNotEmpty && !EmailValidator.validate(email)) {
    return "유효하지 않은 이메일입니다.";
  }
  return null;
}

@riverpod
class Password extends _$Password {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
String? passwordError(PasswordErrorRef ref) {
  final password = ref.watch(passwordProvider);

  if (password.isNotEmpty && !Valid.password.hasMatch(password)) {
    return "유효하지 않은 비밀번호입니다. (영문+숫자 8~16)";
  }
  return null;
}

@riverpod
bool signInEnabled(SignInEnabledRef ref) {
  final email = ref.watch(emailProvider);
  final emailError = ref.watch(emailErrorProvider);
  final password = ref.watch(passwordProvider);
  final passwordError = ref.watch(passwordErrorProvider);

  if (email.isEmpty || emailError != null || password.isEmpty || passwordError != null) {
    return false;
  }
  return true;
}

Future<void> onSignIn(BuildContext context, WidgetRef ref) async {
  FocusScope.of(context).unFocus();

  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.watch(authServiceProvider);
    final usersService = ref.read(usersServiceProvider);

    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    final data = await authService.signIn(
      email: email,
      password: password,
      fcmToken: ref.read(fcmTokenProvider),
    );

    ref.read(appSignInTypeProvider.notifier).update(SignInType.defaultSignIn);
    ref.read(appEmailProvider.notifier).update(email);
    ref.read(appPasswordProvider.notifier).update(password);

    ref.read(accessTokenProvider.notifier).update(data.accessToken);
    ref.read(refreshTokenProvider.notifier).update(data.refreshToken);

    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());

    loading.update(false);

    ref.read(routerProvider).go(AppRoute.main);
  } on String catch (errorCode) {
    loading.update(false);

    late String errorText;

    switch (errorCode) {
      case "bad_request":
        errorText = "유효하지 않은 이메일 또는 비밀번호입니다.";
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
