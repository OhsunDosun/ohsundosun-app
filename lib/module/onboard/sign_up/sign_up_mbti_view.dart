part of 'sign_up_view.dart';

class SignUpMBTIView extends ConsumerWidget {
  const SignUpMBTIView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mbti = ref.watch(signUpMBTIProvider);
    final nickname = ref.watch(nicknameProvider);

    return ODSafeColumn(
      bottom: true,
      children: [
        const ODBackAppBar(),
        Expanded(
          child: ODSingleScroll(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: nickname,
                          style: SpoqaHanSansNeo.bold.set(
                            size: 20,
                            height: 28,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                        TextSpan(
                          text: " 님의\nMBTI 유형을 선택해주세요.",
                          style: SpoqaHanSansNeo.light.set(
                            size: 20,
                            height: 28,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ],
                    ),
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
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.intj,
                          checked: mbti == MBTI.intj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.intj),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.entj,
                          checked: mbti == MBTI.entj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.entj),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(7),
                  Row(
                    children: [
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.intp,
                          checked: mbti == MBTI.intp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.intp),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.entp,
                          checked: mbti == MBTI.entp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.entp),
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
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.infj,
                          checked: mbti == MBTI.infj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.infj),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.enfj,
                          checked: mbti == MBTI.enfj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.enfj),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(7),
                  Row(
                    children: [
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.infp,
                          checked: mbti == MBTI.infp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.infp),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.enfp,
                          checked: mbti == MBTI.enfp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.enfp),
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
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.isfj,
                          checked: mbti == MBTI.isfj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.isfj),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.esfj,
                          checked: mbti == MBTI.esfj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.esfj),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(7),
                  Row(
                    children: [
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.istj,
                          checked: mbti == MBTI.istj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.istj),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.estj,
                          checked: mbti == MBTI.estj,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.estj),
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
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.isfp,
                          checked: mbti == MBTI.isfp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.isfp),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.esfp,
                          checked: mbti == MBTI.esfp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.esfp),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(7),
                  Row(
                    children: [
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.istp,
                          checked: mbti == MBTI.istp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.istp),
                        ),
                      ),
                      ODWidth(10),
                      Expanded(
                        child: ODMBTIButton(
                          MBTI.estp,
                          checked: mbti == MBTI.estp,
                          onTap: () => ref.read(signUpMBTIProvider.notifier).update(MBTI.estp),
                        ),
                      ),
                    ],
                  ),
                  ODHeight(20),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ODButton(
            "가입완료",
            enabled: mbti != null,
            onTap: () => onSignUp(context, ref),
          ),
        ),
        ODHeight(20),
      ],
    );
  }
}
