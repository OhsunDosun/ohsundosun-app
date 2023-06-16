import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/model/response/auth/verify_response.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/util/valid.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
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

onUpdateNickname(
  BuildContext context,
  WidgetRef ref,
) async {
  FocusScope.of(context).unFocus();

  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final usersService = ref.watch(usersServiceProvider);
    final nickname = ref.watch(nicknameProvider);

    await usersService.updateNickname(
      nickname: nickname,
    );
    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());

    loading.update(false);

    ref.watch(routerProvider).pop();
  } catch (e) {
    loading.update(false);
  }
}

@riverpod
class PasswordEnabled extends _$PasswordEnabled {
  @override
  bool build() => false;

  void update(bool value) {
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
class Oldpassword extends _$Oldpassword {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
String? oldpasswordError(OldpasswordErrorRef ref) {
  final password = ref.watch(oldpasswordProvider);

  if (password.isNotEmpty && !Valid.password.hasMatch(password)) {
    return "유효하지 않은 비밀번호입니다. (영문+숫자 8~16)";
  }
  return null;
}

@riverpod
bool okEnabled(OkEnabledRef ref) {
  final oldpassword = ref.watch(oldpasswordErrorProvider);
  final password = ref.watch(passwordErrorProvider);
  final passwordVerify = ref.watch(passwordVerifyMessageTypeProvider);

  if (oldpassword == null && password == null && passwordVerify == MessageType.success) {
    return true;
  }

  return false;
}

onUpdatePassword(
  BuildContext context,
  WidgetRef ref,
) async {
  FocusScope.of(context).unFocus();

  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final usersService = ref.read(usersServiceProvider);
    final password = ref.read(passwordProvider);
    final oldpassword = ref.read(oldpasswordProvider);

    await usersService.updatePassword(
      newpassword: password,
      oldpassword: oldpassword,
    );

    loading.update(false);

    ref.read(routerProvider).pop();
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
