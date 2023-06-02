import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class Star extends _$Star {
  @override
  double build() => 5;

  void update(double value) {
    state = value;
  }
}

@riverpod
class Feedback extends _$Feedback {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

onAddRating(BuildContext context, WidgetRef ref) async {
  final usersService = ref.read(usersServiceProvider);

  await usersService.addRating(
    feedback: ref.read(feedbackProvider),
    rating: ref.read(starProvider),
  );

  ref.watch(routerProvider).pop();
}
