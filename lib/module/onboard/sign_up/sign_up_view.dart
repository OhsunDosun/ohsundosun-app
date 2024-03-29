import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/module/onboard/sign_up/sign_up_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohsundosun/style/index.dart';

part 'sign_up_info_view.dart';
part 'sign_up_mbti_view.dart';
part 'sign_up_complete_view.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageController = ref.watch(pageControllerProvider);
    ref.watch(nicknameProvider);
    ref.watch(emailProvider);
    ref.watch(passwordProvider);
    ref.watch(signUpMBTIProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unFocus(),
      child: Scaffold(
        body: ODSafeColumn(
          top: true,
          children: [
            const ODBackAppBar(
              text: '회원가입',
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  SignUpInfoView(),
                  SignUpMBTIView(),
                  SignUpCompleteView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
