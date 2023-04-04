import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/module/main/setting/user_info/user_info_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

part 'user_info_widget.dart';

class UserInfoView extends ConsumerWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final loading = ref.watch(loadingProvider);
    final userInfo = ref.watch(userInfoProvider);
    ref.watch(nicknameProvider);
    ref.watch(nicknameCancelableOperationProvider);

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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return ODConfirmModal(
                          content: Padding(
                            padding: EdgeInsets.only(top: 18.h, bottom: 8.h),
                            child: Column(
                              children: [
                                Text(
                                  "닉네임 수정",
                                  style: SpoqaHanSansNeo.bold.set(
                                    size: 20,
                                    height: 30,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                                ODHeight(7),
                                ODInput(
                                  maxLength: 8,
                                  onChanged: (value) => ref.read(nicknameProvider.notifier).update(value),
                                  message: ref.watch(nicknameMessageProvider),
                                  messageType: ref.watch(nicknameMessageTypeProvider),
                                ),
                              ],
                            ),
                          ),
                          okEnabled: ref.watch(nicknameEnabledProvider),
                          onOkTap: () => onUpdateNickname(context, ref),
                          onCancelTap: () => context.pop(),
                        );
                      },
                    );
                  },
                );
              },
            ),
            const InfoItem("비밀번호 변경"),
          ],
        ),
      ),
    );
  }
}
