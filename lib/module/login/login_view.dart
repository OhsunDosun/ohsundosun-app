import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/config/route.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

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
            ODHeight(27),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "이메일 아이디를 입력하여 \n오순도순에 로그인합니다.",
                style: SpoqaHanSansNeo.bold.set(
                  size: 20,
                  height: 28,
                  letter: -1,
                  color: ColorStyles.black100,
                ),
              ),
            ),
            ODHeight(50),
            Row(
              children: [
                ODHeight(10),
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
            ODHeight(6),
            Row(
              children: [
                ODHeight(10),
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
            ODHeight(24),
            Row(
              children: [
                ODWidth(10),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorStyles.black100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "로그인",
                        style: SpoqaHanSansNeo.bold.set(
                          size: 16,
                          height: 35,
                          letter: -1,
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                  ),
                ),
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
                ODWidth(7),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.pwfind);
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
            ODHeight(287),
            const ODSafeBox(
              bottom: true,
            ),
          ],
        ),
      ),
    );
  }
}
