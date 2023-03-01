import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/config/route.dart';
import 'package:ohsundosun/style/color_styles.dart';
import 'package:ohsundosun/widget/appbar.dart';
import 'package:ohsundosun/widget/safebox.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ODBackAppBar(),
            const SizedBox(
              height: 27,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "이메일 아이디를 입력하여 \n오순도순에 로그인합니다.",
                style: TextStyle(
                  color: ColorStyles.black100,
                  fontSize: 20,
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
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyles.black20,
                        width: 1,
                      ),
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '이메일 아이디',
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
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyles.black20,
                        width: 1,
                      ),
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '비밀번호',
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
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorStyles.black100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          color: ColorStyles.white,
                          fontSize: 16,
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
              children: [
                const Text("🔑   비밀번호를 잊어버리셨나요?"),
                const SizedBox(
                  width: 7,
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
              height: 301,
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
