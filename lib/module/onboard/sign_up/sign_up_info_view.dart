part of 'sign_up_view.dart';

class SignUpInfoView extends ConsumerWidget {
  const SignUpInfoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageController = ref.watch(pageControllerProvider);

    return Column(
      children: [
        const ODBackAppBar(),
        Expanded(
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
                    Expanded(
                      flex: 2,
                      child: ODInput(
                        hintText: "사용중인 이메일을 입력하세요.",
                        onChanged: (value) => ref.read(emailProvider.notifier).update(value),
                      ),
                    ),
                    ODWidth(7),
                    Expanded(
                      child: ODButton(
                        '중복 확인',
                        type: ODButtonType.red,
                        onTap: () => emailverifyProvider,
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
                Row(
                  children: [
                    Expanded(
                      child: ODInput(
                        obscureText: true,
                        hintText: "영문+숫자 조합 8~16자",
                        onChanged: (value) => ref.read(passwordProvider.notifier).update(value),
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
                  message: ref.watch(passwordCheckProvider),
                  messageType: ref.watch(passwordMessageTypeProvider),
                ),
                ODHeight(30),
                ODButton(
                  "다음 단계로",
                  onTap: () => pageController.jumpToPage(1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
