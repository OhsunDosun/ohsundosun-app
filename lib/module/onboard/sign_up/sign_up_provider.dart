import 'package:flutter/material.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ohsundosun/util/valid.dart';

part 'sign_up_provider.g.dart';

@riverpod
PageController pageController(PageControllerRef ref) {
  return PageController();
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

// 회원가입 이메일 아이디
@riverpod
class SignUpEmail extends _$SignUpEmail {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
class Nickname extends _$Nickname {
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

@riverpod
String? passwordcheck(PasswordcheckRef ref) {
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
