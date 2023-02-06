import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/config/route.dart';
import 'package:ohsundosun/module/login/login_view.dart';
import 'package:ohsundosun/widget/safebox.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeBox(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("메인 페이지"),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoute.login);
              },
              child: const Text("이동"),
            )
          ],
        ),
      ),
    );
  }
}
