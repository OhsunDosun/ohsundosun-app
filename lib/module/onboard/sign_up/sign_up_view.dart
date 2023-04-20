import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/module/onboard/sign_up/sign_up_provider.dart';
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
    ref.watch(signUpMBTIProvider);
    ref.watch(signUpEmailProvider);

    return Scaffold(
      body: ODSafeBox(
        top: true,
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
    );
  }
}
