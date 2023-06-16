import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/module/onboard/find_password/find_password_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/widget/index.dart';

class FindPasswordView extends ConsumerWidget {
  const FindPasswordView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unFocus();
          },
          child: Scaffold(
            body: ODSafeColumn(
              top: true,
              children: [
                const ODBackAppBar(),
                Expanded(
                  child: ODSingleScroll(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ODSafeColumn(
                        bottom: true,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ODInput(
                                  hintText: "가입한 이메일을 입력하세요.",
                                  message: ref.watch(emailErrorProvider),
                                  onChanged: (value) => ref.read(emailProvider.notifier).update(value),
                                ),
                              ),
                              ODWidth(7),
                              ODButton(
                                "인증 발송",
                                type: ODButtonType.red,
                                width: 92.w,
                                enabled: ref.watch(emailVerifyEnabledProvider),
                                onTap: () => onNewPassword(context, ref),
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
                          ODInput(
                            obscureText: true,
                            hintText: "받으신 임시 비밀번호를 입력하세요.",
                            message: ref.watch(passwordErrorProvider),
                            onChanged: (value) => ref.read(passwordProvider.notifier).update(value),
                          ),
                          ODHeight(25),
                          ODButton(
                            "로그인",
                            enabled: ref.watch(signInEnabledProvider),
                            onTap: () => onSignIn(context, ref),
                          ),
                          ODHeight(20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (ref.watch(loadingProvider)) const ODLoading(),
      ],
    );
  }
}
