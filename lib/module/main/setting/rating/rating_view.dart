import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/module/main/setting/rating/rating_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class RatingView extends ConsumerWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(starProvider);
    ref.watch(feedbackProvider);

    return Stack(
      children: [
        Scaffold(
          body: ODSafeColumn(
            top: true,
            bottom: true,
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
                          Expanded(
                            flex: 2,
                            child: RatingBar(
                              glow: false,
                              initialRating: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const ODPngImage(
                                  PngImage.fullstar,
                                  height: 40,
                                  fit: BoxFit.fitHeight,
                                ),
                                half: const ODPngImage(
                                  PngImage.halfstar,
                                  height: 40,
                                  fit: BoxFit.fitHeight,
                                ),
                                empty: const ODPngImage(
                                  PngImage.emptystar,
                                  height: 40,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (value) {
                                ref.read(starProvider.notifier).update(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      ODHeight(20),
                      Container(
                        height: 6.h,
                        color: ColorStyles.black5,
                      ),
                      ODHeight(17.62),
                      Row(
                        children: [
                          ODWidth(20),
                          Text(
                            textAlign: TextAlign.start,
                            "의견 남기기",
                            style: SpoqaHanSansNeo.bold.set(
                              size: 18,
                              height: 27,
                              letter: -1,
                            ),
                          ),
                        ],
                      ),
                      ODHeight(22.53),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextField(
                          minLines: 10,
                          maxLines: null,
                          maxLength: 1000,
                          onChanged: (value) {
                            ref.read(feedbackProvider.notifier).update(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "내용을 입력하세요.",
                            hintStyle: SpoqaHanSansNeo.regular.set(
                              size: 15,
                              height: 22.5,
                              letter: -1,
                              color: ColorStyles.black10,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.h,
                        color: ColorStyles.black5,
                      ),
                      ODHeight(48),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ODButton(
                  "평가 완료",
                  onTap: () => onAddRating(context, ref),
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
