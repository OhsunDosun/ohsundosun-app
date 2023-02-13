import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/style/color_style.dart';
import 'package:ohsundosun/widget/appbar.dart';
import 'package:ohsundosun/widget/safebox.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeBox(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BackAppBar(),
            const SizedBox(
              height: 27,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: const Text(
                "이메일 아이디를 입력하여 \n오순도순에 로그인합니다.",
                style: TextStyle(
                  color: ColorStyle.black100,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(15),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyle.black20,
                        width: 1,
                      ),
                      color: ColorStyle.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "이메일 아이디",
                      style: TextStyle(
                        color: ColorStyle.black40,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(17),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyle.black20,
                        width: 1,
                      ),
                      color: ColorStyle.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "비밀번호",
                      style: TextStyle(
                        color: ColorStyle.black40,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorStyle.black100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
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
                  width: 7,
                ),
                Text("비밀번호 찾기"),
              ],
            ),
            const SizedBox(
              height: 301,
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
