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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
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
                            color: ColorStyles.black40,
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
                            color: ColorStyles.black100,
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
                      Container(
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
                    ],
                  ),
                  ODHeight(64),
                  const ODPngImage(
                    PngImage.signUp,
                    height: 110,
                    fit: BoxFit.fitHeight,
                  ),
                  Row(
                    children: [
                      ODWidth(5),
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
                  ODHeight(84),
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
