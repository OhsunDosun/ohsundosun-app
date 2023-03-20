import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:dotted_line/dotted_line.dart';

part 'setting_widget.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ODBackAppBar(),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 31.h),
              child: Container(
                height: 100.h,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorStyles.black100,
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles.black100.withOpacity(0.3),
                      offset: Offset(0, 6.h),
                      blurRadius: 20.r,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "내 정보",
                      style: SpoqaHanSansNeo.bold.set(
                        size: 16,
                        height: 24,
                        letter: -1,
                        color: ColorStyles.white,
                      ),
                    ),
                    ODHeight(15),
                    Row(
                      children: [
                        ODBadge(
                          userInfo.mbti.toString(),
                          type: userInfo.mbti.toODBadgeType(),
                        ),
                        ODWidth(5),
                        Expanded(
                          child: Text(
                            userInfo.nickname,
                            style: SpoqaHanSansNeo.regular.set(
                              size: 15,
                              height: 22.5,
                              letter: -1,
                              color: ColorStyles.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => context.go(AppRoute.userInfo),
                          child: Row(
                            children: [
                              const ODSvgImage(
                                SvgImage.icWrite,
                                size: 14,
                              ),
                              ODWidth(5),
                              Text(
                                "수정하기",
                                style: SpoqaHanSansNeo.regular.set(
                                  size: 13,
                                  letter: -1,
                                  color: ColorStyles.black40,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, bottom: 9.h),
              child: Text(
                "앱 환결설정",
                style: SpoqaHanSansNeo.bold.set(
                  size: 18,
                  height: 27,
                  letter: -1,
                  color: ColorStyles.black100,
                ),
              ),
            ),
            const SettingItem("댓글 알림"),
            const SettingItem("평가하기"),
            SettingItem(
              "로그아웃",
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return ODConfirmModal(
                    text: "로그아웃을 하시겠습니까?",
                    onCancelTap: () => context.pop(),
                    onOkTap: () => onSignOut(ref),
                  );
                },
              ),
            ),
            const Spacer(),
            Container(
              color: ColorStyles.black5,
              child: Column(
                children: [
                  Container(
                    height: 54.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Text(
                          "더이상 오순도순을 쓰고싶지 않나요?",
                          style: SpoqaHanSansNeo.regular.set(
                            size: 11,
                            letter: -1,
                            color: ColorStyles.black40,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: DottedLine(
                              direction: Axis.horizontal,
                              dashLength: 2.w,
                              dashColor: ColorStyles.black20,
                              dashGapLength: 2.w,
                              dashGapColor: ColorStyles.transparent,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return ODConfirmModal(
                                text: "오순도순을 탈퇴하시겠습니까?",
                                onCancelTap: () => context.pop(),
                                onOkTap: () => onSignOut(ref),
                              );
                            },
                          ),
                          child: Row(
                            children: [
                              const ODSvgImage(
                                SvgImage.icLeave,
                                size: 16,
                              ),
                              ODWidth(4),
                              Text(
                                "탈퇴하기",
                                style: SpoqaHanSansNeo.regular.set(
                                  size: 13,
                                  letter: -1,
                                  color: ColorStyles.black40,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const ODSafeBox(
                    bottom: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
