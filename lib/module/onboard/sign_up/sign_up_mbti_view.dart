part of 'sign_up_view.dart';

class SignUpMBTIView extends ConsumerWidget {
  const SignUpMBTIView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageController = ref.watch(pageControllerProvider);

    return Column(
      children: [
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
                            size: 20,
                            height: 28,
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
                        child: RichText(
                          text: TextSpan(
                            text: '분석형 ',
                            style: SpoqaHanSansNeo.bold.set(
                              size: 18,
                              height: 35,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/ NT',
                                style: SpoqaHanSansNeo.light.set(
                                  size: 16,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                              ),
                            ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "INTJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n용의주도한 전략가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n과학자형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ENTJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n대담한 통솔자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n지도자형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "INTP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n논리적인 사색가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n아이디어 뱅크형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ENTP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n뜨거운 논쟁을 즐기는 변론가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n발명가형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                        child: RichText(
                          text: TextSpan(
                            text: '외교형 ',
                            style: SpoqaHanSansNeo.bold.set(
                              size: 18,
                              height: 35,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/ NF',
                                style: SpoqaHanSansNeo.light.set(
                                  size: 16,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                              ),
                            ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "INFJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n통찰력 있는 선지자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n예언자형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ENFJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n정의로운 사회운동가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n언변능숙형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "INFP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n열정적인 중재자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n잔다르크형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ENFP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n재기발랄한 활동가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n스파크형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                        child: RichText(
                          text: TextSpan(
                            text: '관리자형 ',
                            style: SpoqaHanSansNeo.bold.set(
                              size: 18,
                              height: 35,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/ SJ',
                                style: SpoqaHanSansNeo.light.set(
                                  size: 16,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                              ),
                            ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ISFJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n용감한 수호자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n수호자형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ESFJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n사교적인 외교관",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n친선도모형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ISTJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n청렴결백한 논리주의자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n세상의 소금형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ESTJ",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n엄격한 관리자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n사업자형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                        child: RichText(
                          text: TextSpan(
                            text: '탐험가형 ',
                            style: SpoqaHanSansNeo.bold.set(
                              size: 18,
                              height: 35,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/ SP',
                                style: SpoqaHanSansNeo.light.set(
                                  size: 16,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                              ),
                            ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ISFP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n호기심 많은 예술가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n성인군자형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ESFP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n자유로운 영혼의 연예인",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n사교형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
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
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ISTP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n논리적인 실용주의자",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n백과사전형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ODWidth(7),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 98.h,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.black10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "ESTP",
                                style: SpoqaHanSansNeo.bold.set(
                                  size: 22,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n모험을 즐기는 사업가",
                                    style: SpoqaHanSansNeo.light.set(
                                      size: 12,
                                      height: 15,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n활동가형",
                                    style: SpoqaHanSansNeo.medium.set(
                                      size: 12,
                                      height: 20,
                                      letter: -1,
                                      color: ColorStyles.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(40),
                  ODButton(
                    "가입완료",
                    onTap: () => pageController.jumpToPage(2),
                  ),
                  ODHeight(40),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
