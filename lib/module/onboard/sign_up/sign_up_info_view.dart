part of 'sign_up_view.dart';

class SignUpInfoView extends ConsumerWidget {
  const SignUpInfoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageController = ref.watch(pageControllerProvider);
    ref.watch(nicknameProvider);
    ref.watch(nicknameCancelableOperationProvider);

    return Stack(
      children: [
        Column(
          children: [
            const ODBackAppBar(),
            Expanded(
              child: ODSingleScroll(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ODSafeColumn(
                    bottom: true,
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
                                color: ColorStyles.black40,
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
                                color: ColorStyles.black40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(7),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 10.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorStyles.black10,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFFFF8540),
                                        Color(0xFFFF4040),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(flex: 2, child: SizedBox.shrink()),
                            ],
                          ),
                        ],
                      ),
                      ODHeight(40),
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
                      Row(
                        children: [
                          Expanded(
                            child: ODInput(
                              hintText: "한글,영어 최대 8자",
                              onChanged: (value) => ref.read(nicknameProvider.notifier).update(value),
                              message: ref.watch(nicknameMessageProvider),
                              messageType: ref.watch(nicknameMessageTypeProvider),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ODInput(
                              hintText: "사용중인 이메일을 입력하세요.",
                              onChanged: (value) => ref.read(emailProvider.notifier).update(value),
                              message: ref.watch(emailMessageProvider),
                              messageType: ref.watch(emailMessageTypeProvider),
                            ),
                          ),
                          ODWidth(7),
                          ODButton(
                            '중복 확인',
                            width: 90.w,
                            type: ODButtonType.red,
                            enabled: ref.watch(emailVerifyEnabledProvider),
                            onTap: () => onEmailVerify(ref),
                          ),
                        ],
                      ),
                      ODHeight(15),
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
                      Row(
                        children: [
                          Expanded(
                            child: ODInput(
                              obscureText: true,
                              hintText: "영문+숫자 조합 8~16자",
                              onChanged: (value) => ref.read(passwordProvider.notifier).update(value),
                              message: ref.watch(passwordErrorProvider),
                            ),
                          ),
                        ],
                      ),
                      ODHeight(15),
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
                      ODInput(
                        obscureText: true,
                        hintText: "영문+숫자 조합 8~16자",
                        onChanged: (value) => ref.read(passwordVerifyProvider.notifier).update(value),
                        message: ref.watch(passwordVerifyMessageProvider),
                        messageType: ref.watch(passwordVerifyMessageTypeProvider),
                      ),
                      ODHeight(30),
                      ODButton(
                        "다음 단계로",
                        enabled: ref.watch(nextEnabledProvider),
                        onTap: () => pageController.jumpToPage(1),
                      ),
                      ODHeight(20)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (ref.watch(loadingProvider)) const ODLoading(),
      ],
    );
  }
}
