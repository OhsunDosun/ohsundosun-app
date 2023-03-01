import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/style/color_styles.dart';
import 'package:ohsundosun/widget/appbar.dart';
import 'package:ohsundosun/widget/safebox.dart';

class PwfindView extends ConsumerWidget {
  const PwfindView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ODBackAppBar(),
            const SizedBox(
              height: 27,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "이메일 아이디를 입력하여 \n임시 비밀번호로 로그인합니다.",
                style: TextStyle(
                  color: ColorStyles.black100,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "이메일 아이디",
                style: TextStyle(
                  color: ColorStyles.black100,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyles.black20,
                        width: 1,
                      ),
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '가입한 이메일을 입력하세요.',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorStyles.red100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "인증 발송",
                        style: TextStyle(
                          color: ColorStyles.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "임시 비밀번호",
                style: TextStyle(
                  color: ColorStyles.black100,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyles.black20,
                        width: 1,
                      ),
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '받으신 임시 비밀번호를 입력하세요.',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorStyles.black100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          color: ColorStyles.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
