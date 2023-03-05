import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          children: [
            const ODBackAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ODHeight(25),
                  Text(
                    "이메일 아이디를 입력하여 \n오순도순에 로그인합니다.",
                    style: SpoqaHanSansNeo.bold.set(
                      size: 20,
                      height: 28,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  ODHeight(43),
                  const ODInput(
                    hintText: '이메일 아이디',
                  ),
                  ODHeight(10),
                  const ODInput(
                    obscureText: true,
                    hintText: '비밀번호',
                  ),
                  ODHeight(25),
                  const ODButton(
                    '로그인',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
