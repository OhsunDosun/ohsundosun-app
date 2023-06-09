import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/module/main/setting/user_info/user_info_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

part 'user_info_widget.dart';

class UserInfoView extends ConsumerWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(loadingProvider);
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
              onTap: () => context.go(AppRoute.updateMBTI),
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
            InfoItem(
              "비밀번호 변경",
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "비밀번호 변경",
                                  style: SpoqaHanSansNeo.bold.set(
                                    size: 20,
                                    height: 30,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                                ODHeight(7),
                                Text(
                                  "기존 비밀번호",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 16,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                                ODInput(
                                  hintText: "영문+숫자 조합 8~16자",
                                  maxLength: 16,
                                  onChanged: (value) => ref.read(oldpasswordProvider.notifier).update(value),
                                  message: ref.watch(oldpasswordErrorProvider),
                                ),
                                ODHeight(15),
                                Text(
                                  "비밀번호",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 16,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                                ODInput(
                                  hintText: "영문+숫자 조합 8~16자",
                                  maxLength: 16,
                                  onChanged: (value) => ref.read(passwordProvider.notifier).update(value),
                                  message: ref.watch(passwordErrorProvider),
                                ),
                                ODHeight(15),
                                Text(
                                  "비밀번호 확인",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 16,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                                ODInput(
                                  hintText: "영문+숫자 조합 8~16자",
                                  maxLength: 16,
                                  onChanged: (value) => ref.read(passwordVerifyProvider.notifier).update(value),
                                  message: ref.watch(passwordVerifyMessageProvider),
                                  messageType: ref.watch(passwordVerifyMessageTypeProvider),
                                ),
                                ODHeight(43),
                              ],
                            ),
                          ),
                          okEnabled: ref.watch(okEnabledProvider),
                          onOkTap: () => onUpdatePassword(context, ref),
                          onCancelTap: () => context.pop(),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
