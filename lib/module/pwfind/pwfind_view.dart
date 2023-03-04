import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ODBackAppBar(),
            ODHeight(27),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "이메일 아이디를 입력하여 \n임시 비밀번호로 로그인합니다.",
                style: SpoqaHanSansNeo.bold.set(
                  size: 20,
                  height: 28,
                  letter: -1,
                  color: ColorStyles.black100,
                ),
              ),
            ),
            ODHeight(95),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "이메일 아이디",
                style: SpoqaHanSansNeo.medium.set(
                  size: 16,
                  height: 35,
                  letter: -1,
                  color: ColorStyles.black100,
                ),
              ),
            ),
            ODHeight(7),
            Row(
              children: [
                ODHeight(10),
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
                ),
              ],
            ),
            ODHeight(15),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "임시 비밀번호",
                style: SpoqaHanSansNeo.medium.set(
                  size: 16,
                  height: 35,
                  letter: -1,
                  color: ColorStyles.black100,
                ),
              ),
            ),
            ODHeight(7),
            Row(
              children: [
                ODHeight(7),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '받으신 임시 비밀번호를 입력하세요.',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ODHeight(25),
            Row(
              children: [
                ODWidth(10),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorStyles.black100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "로그인",
                        style: SpoqaHanSansNeo.bold.set(
                          size: 16,
                          height: 35,
                          letter: -1,
                          color: ColorStyles.white,
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
