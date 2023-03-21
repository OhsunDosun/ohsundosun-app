import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

part 'user_info_widget.dart';

class UserInfoView extends ConsumerWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          children: [
            const ODBackAppBar(
              text: "내 정보 수정",
            ),
            InfoItem(
              "MBTI",
              right: ODBadge(
                userInfo.mbti.toString(),
                type: userInfo.mbti.toODBadgeType(),
              ),
            ),
            InfoItem(
              "닉네임",
              right: Text(
                userInfo.nickname,
                style: SpoqaHanSansNeo.medium.set(
                  size: 15,
                  height: 22.5,
                  letter: -1,
                  color: ColorStyles.black100,
                ),
              ),
            ),
            const InfoItem("비밀번호 변경"),
          ],
        ),
      ),
    );
  }
}
