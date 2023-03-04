import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/config/route.dart';
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
                children: [
                  ODHeight(100),
                  Image.asset(PngImage.mainLogo),
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
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ODWidth(20),
                Expanded(
                  child: ODButton(
                    "로그인",
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.login);
                    },
                    type: ODButtonType.black,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: ODButton(
                    "회원가입",
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.register);
                    },
                    type: ODButtonType.red,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("🔑   비밀번호를 잊어버리셨나요?"),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.pwfind);
                  },
                  child: const Text("비밀번호 찾기"),
                ),
              ],
            ),
            const SizedBox(
              height: 47,
            ),
            const ODSafeBox(
              bottom: true,
            ),
          ],
        ),
      ),
    );
  }
}
