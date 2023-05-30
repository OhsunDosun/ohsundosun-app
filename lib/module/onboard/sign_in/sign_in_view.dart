import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

import 'sign_in_provider.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(emailProvider);
    ref.watch(passwordProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            ODSafeBox(
              top: true,
              child: Column(
                children: [
                  const ODBackAppBar(),
                  Expanded(
                    child: ODSingleScroll(
                      child: Padding(
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
                            ODInput(
                              hintText: '이메일 아이디',
                              message: ref.watch(emailErrorProvider),
                              onChanged: (value) => ref.read(emailProvider.notifier).update(value),
                            ),
                            ODHeight(10),
                            ODInput(
                              obscureText: true,
                              hintText: '비밀번호',
                              message: ref.watch(passwordErrorProvider),
                              onChanged: (value) => ref.read(passwordProvider.notifier).update(value),
                            ),
                            ODHeight(25),
                            ODButton(
                              '로그인',
                              enabled: ref.watch(signInEnabledProvider),
                              onTap: () => onSignIn(context, ref),
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
                                    context.go(AppRoute.findPassword);
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
                            ODHeight(15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (ref.watch(loadingProvider)) const ODLoading(),
          ],
        ),
      ),
    );
  }
}
