import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohsundosun/style/index.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "회원가입",
                    style: SpoqaHanSansNeo.bold.set(
                      size: 28,
                      height: 35,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  ODHeight(80),
                  const LinearProgressIndicator(
                    value: 0.33,
                  ),
                  ODHeight(25),
                  Text(
                    "닉네임",
                    style: SpoqaHanSansNeo.medium.set(
                      size: 16,
                      height: 35,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  const ODInput(
                    hintText: "한글, 영어 최대 8자",
                  ),
                  ODHeight(15),
                  Text(
                    "이메일 아이디",
                    style: SpoqaHanSansNeo.medium.set(
                      size: 16,
                      height: 35,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: ODInput(
                          hintText: "사용중인 이메일을 입력하세요.",
                        ),
                      ),
                      ODWidth(7),
                      Container(
                        height: 52.h,
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        decoration: BoxDecoration(
                          color: ColorStyles.red100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "중복 확인",
                            style: SpoqaHanSansNeo.medium.set(
                              size: 15,
                              height: 35,
                              letter: -1,
                              color: ColorStyles.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                  const ODInput(
                    obscureText: true,
                    hintText: "영문+숫자 조합 8~16자",
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
                  const ODInput(
                    obscureText: true,
                    hintText: "영문+숫자 조합 8~16자",
                  ),
                  ODHeight(75),
                  const ODButton("다음 단계로"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
