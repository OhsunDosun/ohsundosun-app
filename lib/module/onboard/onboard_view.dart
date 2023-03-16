import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class OnboardView extends ConsumerWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    PngImage.mainLogo,
                    height: 218.h,
                    width: 302.w,
                  ),
                  ODHeight(47),
                  Text(
                    "MBTI 대화를 하고싶다면,\n바로 여기 오순도순에서!",
                    style: SpoqaHanSansNeo.bold.set(
                      size: 24,
                      height: 32,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  ODHeight(12),
                  Text(
                    "16개의 성격 유형, 오순도순 우리들의 이야기",
                    style: SpoqaHanSansNeo.regular.set(
                      size: 16,
                      height: 20,
                      letter: -1,
                      color: ColorStyles.black80,
                    ),
                  ),
                ],
              ),
            ),
            ODHeight(62),
            Row(
              children: [
                ODWidth(20),
                Expanded(
                  child: ODButton(
                    "로그인",
                    onTap: () {
                      context.go(AppRoute.login);
                    },
                    type: ODButtonType.black,
                  ),
                ),
                ODWidth(7),
                Expanded(
                  child: ODButton(
                    "회원가입",
                    onTap: () {
                      context.go(AppRoute.register);
                    },
                    type: ODButtonType.red,
                  ),
                ),
                ODWidth(20),
              ],
            ),
            ODHeight(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "🔑   비밀번호를 잊어버리셨나요?",
                  style: SpoqaHanSansNeo.regular.set(
                    size: 13,
                    height: 19.5,
                    letter: -1,
                  ),
                ),
                ODWidth(8),
                InkWell(
                  onTap: () {
                    context.go(AppRoute.pwfind);
                  },
                  child: Text(
                    "비밀번호 찾기",
                    style: SpoqaHanSansNeo.medium.set(
                      size: 13,
                      height: 19.5,
                      letter: -1,
                    ),
                  ),
                ),
              ],
            ),
            ODHeight(47),
            const ODSafeBox(
              bottom: true,
            ),
          ],
        ),
      ),
    );
  }
}
