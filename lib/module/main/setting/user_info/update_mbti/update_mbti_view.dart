import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/module/main/setting/user_info/update_mbti/update_mbti_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class UpdateMBTIView extends ConsumerWidget {
  const UpdateMBTIView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mbti = ref.watch(updateMBTIProvider);
    final userInfo = ref.watch(userInfoProvider);

    return Stack(
      children: [
        Scaffold(
          body: ODSafeColumn(
            top: true,
            bottom: true,
            children: [
              const ODBackAppBar(
                text: "MBTI 수정",
              ),
              ODHeight(20),
              Expanded(
                child: ODSingleScroll(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: userInfo.nickname,
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
                            const ODSvgImage(
                              SvgImage.icLogoPurple,
                              size: 18,
                            ),
                            ODWidth(5),
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
                        ODHeight(18),
                        Row(
                          children: [
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.intj,
                                checked: mbti == MBTI.intj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.intj),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.entj,
                                checked: mbti == MBTI.entj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.entj),
                              ),
                            ),
                          ],
                        ),
                        ODHeight(10),
                        Row(
                          children: [
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.intp,
                                checked: mbti == MBTI.intp,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.intp),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.entp,
                                checked: mbti == MBTI.entp,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.entp),
                              ),
                            ),
                          ],
                        ),
                        ODHeight(40),
                        Row(
                          children: [
                            const ODSvgImage(
                              SvgImage.icLogoGreen,
                              size: 18,
                            ),
                            ODWidth(5),
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
                        ODHeight(18),
                        Row(
                          children: [
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.infj,
                                checked: mbti == MBTI.infj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.infj),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.enfj,
                                checked: mbti == MBTI.enfj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.enfj),
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
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.infp),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.enfp,
                                checked: mbti == MBTI.enfp,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.enfp),
                              ),
                            ),
                          ],
                        ),
                        ODHeight(40),
                        Row(
                          children: [
                            const ODSvgImage(
                              SvgImage.icLogoBlue,
                              size: 18,
                            ),
                            ODWidth(5),
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
                        ODHeight(18),
                        Row(
                          children: [
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.isfj,
                                checked: mbti == MBTI.isfj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.isfj),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.esfj,
                                checked: mbti == MBTI.esfj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.esfj),
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
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.istj),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.estj,
                                checked: mbti == MBTI.estj,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.estj),
                              ),
                            ),
                          ],
                        ),
                        ODHeight(40),
                        Row(
                          children: [
                            const ODSvgImage(
                              SvgImage.icLogoOrange,
                              size: 18,
                            ),
                            ODWidth(5),
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
                        ODHeight(18),
                        Row(
                          children: [
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.isfp,
                                checked: mbti == MBTI.isfp,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.isfp),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.esfp,
                                checked: mbti == MBTI.esfp,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.esfp),
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
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.istp),
                              ),
                            ),
                            ODWidth(10),
                            Expanded(
                              child: ODMBTIButton(
                                MBTI.estp,
                                checked: mbti == MBTI.estp,
                                onTap: () => ref.read(updateMBTIProvider.notifier).update(MBTI.estp),
                              ),
                            ),
                          ],
                        ),
                        ODHeight(
                          20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ODButton(
                  "수정 완료",
                  onTap: () => onUpdateMBTI(context, ref),
                ),
              ),
              ODHeight(20),
            ],
          ),
        ),
        if (ref.watch(loadingProvider)) const ODLoading(),
      ],
    );
  }
}
