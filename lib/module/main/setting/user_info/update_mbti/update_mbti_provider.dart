import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_mbti_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class UpdateMBTI extends _$UpdateMBTI {
  @override
  MBTI build() => ref.read(userInfoProvider).mbti;

  void update(MBTI value) {
    state = value;
  }
}

onUpdateMBTI(BuildContext context, WidgetRef ref) async {
  final usersService = ref.read(usersServiceProvider);
  final loading = ref.read(loadingProvider.notifier);

  loading.update(true);

  try {
    await usersService.updateMBTI(
      mbti: ref.read(updateMBTIProvider),
    );
    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());

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
