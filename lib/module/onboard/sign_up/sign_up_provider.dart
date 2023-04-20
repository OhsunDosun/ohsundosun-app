import 'package:flutter/material.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
