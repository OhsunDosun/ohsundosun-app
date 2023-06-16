import 'package:async/async.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/response/auth/verify_response.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ohsundosun/util/valid.dart';

part 'sign_up_provider.g.dart';

@riverpod
PageController pageController(PageControllerRef ref) {
  return PageController();
}

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

// 회원가입 MBTI
@riverpod
class SignUpMBTI extends _$SignUpMBTI {
  @override
  MBTI? build() => null;

  void update(MBTI? value) {
    state = value;
  }
}

@riverpod
class Email extends _$Email {
  @override
  String build() => "";

  void update(String value) {
    ref.read(emailMessageProvider.notifier).update(null);
    ref.read(emailMessageTypeProvider.notifier).update(MessageType.error);

    state = value;
  }
}

@riverpod
class EmailMessageType extends _$EmailMessageType {
  @override
  MessageType build() => MessageType.error;

  void update(MessageType value) {
    state = value;
  }
}

@riverpod
class EmailMessage extends _$EmailMessage {
  @override
  String? build() => null;

  void update(String? value) {
    state = value;
  }
}

@riverpod
bool emailVerifyEnabled(EmailVerifyEnabledRef ref) {
  final email = ref.watch(emailProvider);

  if (!EmailValidator.validate(email)) {
    return false;
  }
  return true;
}

@riverpod
class NicknameCancelableOperation extends _$NicknameCancelableOperation {
  @override
  CancelableOperation<VerifyData>? build() => null;

  void update(CancelableOperation<VerifyData>? value) {
    state = value;
  }
}

@riverpod
class NicknameMessage extends _$NicknameMessage {
  @override
  String? build() => null;

  void update(String? value) {
    state = value;
  }
}

@riverpod
class NicknameMessageType extends _$NicknameMessageType {
  @override
  MessageType build() => MessageType.error;

  void update(MessageType value) {
    state = value;
  }
}

@riverpod
class Nickname extends _$Nickname {
  @override
  String build() => "";

  Future<void> update(String value) async {
    final authService = ref.read(authServiceProvider);
    final nicknameCancelableOperation = ref.read(nicknameCancelableOperationProvider);
    nicknameCancelableOperation?.cancel();
    ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.error);

    if (value.isNotEmpty) {
      if (!Valid.nickname.hasMatch(value)) {
        ref.read(nicknameMessageProvider.notifier).update("유효하지 않은 닉네임입니다. (한글, 영어 최대 8자)");
        ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.error);
      } else {
        final nicknameCancelableOperation = CancelableOperation.fromFuture(
          authService.verifyNickname(nickname: value),
        ).then(
          (verify) {
            if (verify.available) {
              ref.read(nicknameMessageProvider.notifier).update("사용 가능한 닉네임입니다.");
              ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.success);
            } else {
              ref.read(nicknameMessageProvider.notifier).update("이미 사용중인 닉네임입니다.");
              ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.error);
            }

            state = value;
            return verify;
          },
        );
        ref.read(nicknameCancelableOperationProvider.notifier).update(nicknameCancelableOperation);
      }
    } else {
      ref.read(nicknameMessageProvider.notifier).update(null);
    }
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

@riverpod
String? passwordError(PasswordErrorRef ref) {
  final password = ref.watch(passwordProvider);

  if (password.isNotEmpty && !Valid.password.hasMatch(password)) {
    return "유효하지 않은 비밀번호입니다. (영문+숫자 8~16)";
  }
  return null;
}

@riverpod
class PasswordVerify extends _$PasswordVerify {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
MessageType passwordVerifyMessageType(PasswordVerifyMessageTypeRef ref) {
  final password = ref.watch(passwordProvider);
  final passwordVerify = ref.watch(passwordVerifyProvider);

  if (password.isNotEmpty && passwordVerify.isNotEmpty) {
    if (password != passwordVerify) {
      return MessageType.error;
    } else {
      return MessageType.success;
    }
  }
  return MessageType.error;
}

@riverpod
String? passwordVerifyMessage(PasswordVerifyMessageRef ref) {
  final password = ref.watch(passwordProvider);
  final passwordVerify = ref.watch(passwordVerifyProvider);

  if (password.isNotEmpty && passwordVerify.isNotEmpty) {
    if (password != passwordVerify) {
      return "비밀번호가 일치하지 않습니다.";
    } else {
      return "비밀번호가 일치합니다.";
    }
  }
  return null;
}

@riverpod
bool nextEnabled(NextEnabledRef ref) {
  final nickname = ref.watch(nicknameMessageTypeProvider);
  final email = ref.watch(emailMessageTypeProvider);
  final password = ref.watch(passwordErrorProvider);
  final passwordVerify = ref.watch(passwordVerifyMessageTypeProvider);

  if (nickname == MessageType.success && email == MessageType.success && password == null && passwordVerify == MessageType.success) {
    return true;
  }

  return false;
}

Future<void> onSignUp(BuildContext context, WidgetRef ref) async {
  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.read(authServiceProvider);
    final usersService = ref.read(usersServiceProvider);

    final mbti = ref.read(signUpMBTIProvider);
    final email = ref.read(emailProvider);
    final nickname = ref.read(nicknameProvider);
    final password = ref.read(passwordProvider);

    await usersService.signUp(
      email: email,
      mbti: mbti!,
      nickname: nickname,
      password: password,
    );

    await authService.signIn(
      email: email,
      password: password,
      fcmToken: ref.read(fcmTokenProvider),
    );

    ref.read(appSignInTypeProvider.notifier).update(SignInType.defaultSignIn);
    ref.read(appEmailProvider.notifier).update(email);
    ref.read(appPasswordProvider.notifier).update(password);
    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());

    loading.update(false);

    ref.read(pageControllerProvider).jumpToPage(2);
  } on String catch (errorCode) {
    loading.update(false);

    late String errorText;

    switch (errorCode) {
      default:
        errorText = "알 수 없는 에러가 발생했습니다.";
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

Future<void> onEmailVerify(WidgetRef ref) async {
  final loading = ref.read(loadingProvider.notifier);
  final emailMessage = ref.read(emailMessageProvider.notifier);
  final emailMessageType = ref.read(emailMessageTypeProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.read(authServiceProvider);

    final email = ref.read(emailProvider);

    final data = await authService.verifyEmail(
      email: email,
    );

    loading.update(false);

    if (data.available) {
      emailMessage.update("사용 가능한 이메일입니다.");
      emailMessageType.update(MessageType.success);
    } else {
      emailMessage.update("이미 사용중인 이메일입니다.");
      emailMessageType.update(MessageType.error);
    }
  } on String catch (errorCode) {
    loading.update(false);

    late String errorText;

    switch (errorCode) {
      default:
        errorText = "알 수 없는 에러가 발생했습니다.";
        break;
    }

    emailMessage.update(errorText);
    emailMessageType.update(MessageType.error);
  }
}
