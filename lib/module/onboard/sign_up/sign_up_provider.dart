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
class EmailCancelableOperation extends _$EmailCancelableOperation {
  @override
  CancelableOperation<VerifyData>? build() => null;

  void update(CancelableOperation<VerifyData>? value) {
    state = value;
  }
}

@riverpod
class EmailEnabled extends _$EmailEnabled {
  @override
  bool build() => false;

  void update(bool value) {
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
class NicknameEnabled extends _$NicknameEnabled {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class Nickname extends _$Nickname {
  @override
  String build() => "";

  Future<void> update(String value) async {
    final authService = ref.watch(authServiceProvider);
    final nicknameCancelableOperation = ref.watch(nicknameCancelableOperationProvider);
    nicknameCancelableOperation?.cancel();

    if (value.isNotEmpty) {
      if (!Valid.nickname.hasMatch(value)) {
        ref.read(nicknameMessageProvider.notifier).update("유효하지 않은 닉네임입니다. (한글, 영어 최대 8자)");
        ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.error);
        ref.read(nicknameEnabledProvider.notifier).update(false);
      } else {
        final nicknameCancelableOperation = CancelableOperation.fromFuture(
          authService.verifyNickname(nickname: value),
        ).then(
          (verify) {
            if (verify.available) {
              ref.read(nicknameMessageProvider.notifier).update("사용 가능한 닉네임입니다.");
              ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.success);
              ref.read(nicknameEnabledProvider.notifier).update(true);
            } else {
              ref.read(nicknameMessageProvider.notifier).update("이미 사용중인 닉네임입니다.");
              ref.read(nicknameMessageTypeProvider.notifier).update(MessageType.error);
              ref.read(nicknameEnabledProvider.notifier).update(false);
            }

            state = value;
            return verify;
          },
        );
        ref.read(nicknameCancelableOperationProvider.notifier).update(nicknameCancelableOperation);
      }
    } else {
      ref.read(nicknameMessageProvider.notifier).update(null);
      ref.read(nicknameEnabledProvider.notifier).update(false);
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
class PasswordVerify extends _$PasswordVerify {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
class Emailverify extends _$Emailverify {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
String? passwordCheck(PasswordCheckRef ref) {
  final password = ref.watch(passwordProvider);

  if (password.isEmpty && !Valid.password.hasMatch(password)) {
    return "비밀번호가 일치합니다.";
  }
  return null;
}

@riverpod
class PasswordMessageType extends _$PasswordMessageType {
  @override
  MessageType build() => MessageType.success;

  void update(MessageType value) {
    state = value;
  }
}

Future<void> onSignUp(BuildContext context, WidgetRef ref) async {
  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.watch(authServiceProvider);
    final usersService = ref.read(usersServiceProvider);

    final mbti = ref.watch(signUpMBTIProvider);
    final email = ref.watch(emailProvider);
    final nickname = ref.watch(nicknameProvider);
    final password = ref.watch(passwordProvider);

    await usersService.signUp(
      email: email,
      mbti: mbti!,
      nickname: nickname,
      password: password,
    );

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

    ref.read(pageControllerProvider).jumpToPage(2);
  } on String catch (errorCode) {
    loading.update(false);

    late String errorText;

    switch (errorCode) {
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
