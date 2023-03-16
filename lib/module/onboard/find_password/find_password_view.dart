import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class PwfindView extends ConsumerWidget {
  const PwfindView({super.key});

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
                    "이메일 아이디를 입력하여 \n임시 비밀번호로 로그인합니다.",
                    style: SpoqaHanSansNeo.bold.set(
                      size: 20,
                      height: 28,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  ODHeight(95),
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
                          hintText: "가입한 이메일을 입력하세요.",
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
                            "인증 발송",
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
                    "임시 비밀번호",
                    style: SpoqaHanSansNeo.medium.set(
                      size: 16,
                      height: 35,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  const ODInput(
                    hintText: "받으신 임시 비밀번호를 입력하세요.",
                  ),
                  ODHeight(25),
                  const ODButton("로그인"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
