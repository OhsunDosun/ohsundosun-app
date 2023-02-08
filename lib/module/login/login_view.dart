import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/widget/appbar.dart';
import 'package:ohsundosun/widget/safebox.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeBox(
        top: true,
        child: Column(
          children: [
            const BackAppBar(),
          ],
        ),
      ),
    );
  }
}
