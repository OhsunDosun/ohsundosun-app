import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/widget/index.dart';

class UserInfoView extends ConsumerWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          children: const [
            ODBackAppBar(
              text: "내 정보 수정",
            ),
          ],
        ),
      ),
    );
  }
}
