import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ohsundosun/module/login/login_provider.dart';
import 'package:ohsundosun/widget/safebox.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(hello123123WorldProvider);

    return Scaffold(
      body: SafeBox(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("로그인 페이지"),
            SvgPicture.asset('asset/image/ic_logo_register_complete.svg'),
          ],
        ),
      ),
    );
  }
}
