part of 'sign_up_view.dart';

class SignUpCompleteView extends ConsumerWidget {
  const SignUpCompleteView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final nickname = ref.watch(nicknameProvider);

    return WillPopScope(
      onWillPop: () async => true,
      child: Column(
        children: [
          ODBackAppBar(
            onTap: () => context.go(AppRoute.main),
          ),
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
                    value: 1,
                    color: ColorStyles.red100,
                    backgroundColor: ColorStyles.black10,
                  ),
                  ODHeight(197),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '$nickname ',
                            style: SpoqaHanSansNeo.bold.set(
                              size: 20,
                              height: 35,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '님의\n오순도순 회원가입을 축하드립니다!',
                                style: SpoqaHanSansNeo.light.set(
                                  size: 20,
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
                  ODHeight(40),
                  ODButton(
                    "메인으로",
                    onTap: () => context.go(AppRoute.main),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
