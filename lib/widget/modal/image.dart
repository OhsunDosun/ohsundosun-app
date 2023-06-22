part of '../index.dart';

class ODImageModal extends ConsumerWidget {
  final void Function()? onCameraTap;
  final void Function()? onGalleryTap;

  const ODImageModal({
    super.key,
    this.onCameraTap,
    this.onGalleryTap,
  }) : super();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          padding: EdgeInsets.only(top: 28.h, bottom: 38.h),
          decoration: BoxDecoration(
            color: ColorStyles.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Material(
            color: ColorStyles.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "사진 추가",
                  textAlign: TextAlign.center,
                  style: SpoqaHanSansNeo.bold.set(
                    size: 20,
                    letter: -1,
                    color: ColorStyles.black100,
                  ),
                ),
                ODHeight(16),
                Text(
                  "사진추가 방법을 선택하세요.",
                  textAlign: TextAlign.center,
                  style: SpoqaHanSansNeo.medium.set(
                    size: 18,
                    letter: -1,
                    color: ColorStyles.black100,
                  ),
                ),
                ODHeight(26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: onCameraTap,
                          child: Container(
                            height: 54.r,
                            width: 54.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorStyles.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFABB0BC).withOpacity(0.2),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 4.h),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: ODSvgImage(
                                SvgImage.icCamera,
                                size: 33,
                              ),
                            ),
                          ),
                        ),
                        ODHeight(18),
                        Text(
                          "촬영하기",
                          style: SpoqaHanSansNeo.regular.set(
                            size: 13,
                            letter: -1,
                            color: ColorStyles.black60,
                          ),
                        )
                      ],
                    ),
                    ODWidth(27),
                    Column(
                      children: [
                        InkWell(
                          onTap: onGalleryTap,
                          child: Container(
                            height: 54.r,
                            width: 54.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorStyles.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFABB0BC).withOpacity(0.2),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 4.h),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: ODSvgImage(
                                SvgImage.icGallery,
                                size: 33,
                              ),
                            ),
                          ),
                        ),
                        ODHeight(18),
                        Text(
                          "앨범",
                          style: SpoqaHanSansNeo.regular.set(
                            size: 13,
                            letter: -1,
                            color: ColorStyles.black60,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
