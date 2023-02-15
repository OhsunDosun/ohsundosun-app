import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/config/route.dart';
import 'package:ohsundosun/module/login/login_view.dart';
import 'package:ohsundosun/style/color_style.dart';
import 'package:ohsundosun/util/image.dart';
import 'package:ohsundosun/widget/button.dart';
import 'package:ohsundosun/widget/safebox.dart';

class OnboardView extends ConsumerWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeBox(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(Pngs.mainLogo),
                  const SizedBox(
                    height: 47,
                  ),
                  const Text(
                    "MBTI 대화를 하고싶다면,\n바로 여기 오순도순에서!",
                    style: TextStyle(
                      color: ColorStyle.black100,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "16개의 성격 유형, 오순도순 우리들의 이야기",
                    style: TextStyle(
                      color: ColorStyle.black80,
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
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Button(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.login);
                    },
                    type: ButtonType.black,
                    text: "로그인",
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Button(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.register);
                    },
                    type: ButtonType.red,
                    text: "회원가입",
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
              children: const [
                Text("🔑   비밀번호를 잊어버리셨나요?"),
                SizedBox(
                  width: 8,
                ),
                Text("비밀번호 찾기"),
              ],
            ),
            const SizedBox(
              height: 47,
            ),
            const SafeBox(
              bottom: true,
            ),
          ],
        ),
      ),
    );
  }
}
