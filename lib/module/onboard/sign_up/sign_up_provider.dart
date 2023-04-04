import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_provider.g.dart';

@riverpod
PageController pageController(PageControllerRef ref) {
  return PageController();
}
