import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohsundosun/style/index.dart';

class SignUpView extends ConsumerWidget {
  SignUpView({super.key});

  final PageController pageController = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: PageView(
          controller: pageController,
          children: [
            const ODBackAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "회원가입",
                    style: SpoqaHanSansNeo.bold.set(
                      size: 28,
                      height: 35,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                  ODHeight(60),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "계정정보",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "유형선택",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "완료",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(7),
                  const LinearProgressIndicator(
                    minHeight: 8,
                    value: 0.33,
                    color: ColorStyles.red100,
                    backgroundColor: ColorStyles.black10,
                  ),
                  ODHeight(10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          "닉네임",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const ODInput(
                    hintText: "한글, 영어 최대 8자",
                  ),
                  ODHeight(10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          "이메일 아이디",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: ODInput(
                          hintText: "사용중인 이메일을 입력하세요.",
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
                            "중복 확인",
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
                  ODHeight(10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          "비밀번호",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const ODInput(
                    obscureText: true,
                    hintText: "영문+숫자 조합 8~16자",
                  ),
                  ODHeight(10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          "비밀번호 확인",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 16,
                            height: 35,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const ODInput(
                    obscureText: true,
                    hintText: "영문+숫자 조합 8~16자",
                  ),
                  ODHeight(40),
                  const ODButton(
                    "다음 단계로",
                  ),
                ],
              ),
            ),
            const ODBackAppBar(),
            Expanded(
              child: ODSingleScroll(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "회원가입",
                        style: SpoqaHanSansNeo.bold.set(
                          size: 28,
                          height: 35,
                          letter: -1,
                          color: ColorStyles.black100,
                        ),
                      ),
                      ODHeight(60),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "계정정보",
                              style: SpoqaHanSansNeo.medium.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "유형선택",
                              style: SpoqaHanSansNeo.medium.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "완료",
                              style: SpoqaHanSansNeo.medium.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(7),
                      const LinearProgressIndicator(
                        minHeight: 8,
                        value: 0.70,
                        color: ColorStyles.red100,
                        backgroundColor: ColorStyles.black10,
                      ),
                      ODHeight(12),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              "님의\nMBTI 유형을 선택해주세요.",
                              style: SpoqaHanSansNeo.light.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(51),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              "분석형 / NT",
                              style: SpoqaHanSansNeo.light.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "INTJ\n용의주도한 전략가\n과학자형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ENTJ\n대담한 통솔자\n지도자형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(7),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "INTP\n논리적인 사색가\n아이디어 뱅크형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ENTP\n뜨거운 논쟁을 즐기는 변론가\n발명가형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              '외교형 / NF',
                              style: SpoqaHanSansNeo.light.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "INFJ\n통찰력 있는 선지자\n예언자형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ENFJ\n정의로운 사회운동가\n언변능숙형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(7),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "INFP\n열정적인 중재자\n잔다르크형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ENFP\n재기발랄한 활동가\n스파크형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              "관리자형 / SJ",
                              style: SpoqaHanSansNeo.light.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ISFJ\n용감한 수호자\n수호자형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ESFJ\n사교적인 외교관\n친선도모형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(7),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ISTJ\n청렴결백한 논리주의자\n세상의 소금형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ESTJ\n엄격한 관리자\n사업자형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              '탐험가형 / SP',
                              style: SpoqaHanSansNeo.light.set(
                                size: 16,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ISFP\n호기심 많은 예술가\n성인군자형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ESFP\n자유로운 영혼의 연예인\n사교형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(7),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ISTP\n논리적인 실용주의자\n백과사전형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ODWidth(7),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 52.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: ColorStyles.black10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ESTP\n모험을 즐기는 사업가\n활동가형",
                                  style: SpoqaHanSansNeo.medium.set(
                                    size: 15,
                                    height: 35,
                                    letter: -1,
                                    color: ColorStyles.black100,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
