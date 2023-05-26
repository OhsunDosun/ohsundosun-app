import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class RatingView extends ConsumerWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      body: ODSafeBox(
        top: true,
        child: Column(
          children: [
            const ODBackAppBar(
              text: "평가하기",
            ),
            ODHeight(30),
            Expanded(
              child: ODSingleScroll(
                child: Column(
                  children: [
                    const ODPngImage(
                      PngImage.signUp,
                      height: 110,
                      fit: BoxFit.fitHeight,
                    ),
                    ODHeight(23),
                    Row(
                      children: [
                        ODWidth(5),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '오순도순',
                              style: SpoqaHanSansNeo.bold.set(
                                size: 28,
                                height: 35,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '은 어땠나요?',
                                  style: SpoqaHanSansNeo.regular.set(
                                    size: 28,
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
                    ODHeight(17),
                    Text(
                      textAlign: TextAlign.center,
                      '오순도순의 좋았던 점과 불편했던 점을 평가해주세요!\n더욱 발전하는 오순도순이 되겠습니다.',
                      style: SpoqaHanSansNeo.regular.set(
                        size: 15,
                        height: 22.5,
                        letter: -1,
                        color: ColorStyles.black40,
                      ),
                    ),
                    ODHeight(30),
                    Row(
                      children: [
                        ODWidth(20),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.start,
                            '별점',
                            style: SpoqaHanSansNeo.bold.set(
                              size: 18,
                              height: 27,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ODHeight(20),
                    Container(
                      height: 6.h,
                      color: ColorStyles.black5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
