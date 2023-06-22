part of '../index.dart';

class ODPostTypeBottomSheet extends StatelessWidget {
  final PostType type;
  final void Function(PostType type)? onTap;

  const ODPostTypeBottomSheet({
    required this.type,
    this.onTap,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ODSafeBox(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 50.h),
            child: Column(
              children: PostType.values
                  .map(
                    (postType) => InkWell(
                      onTap: onTap != null
                          ? () {
                              onTap!(postType);
                              context.pop();
                            }
                          : null,
                      child: Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned.fill(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      postType.toString(),
                                      style: SpoqaHanSansNeo.medium.set(
                                        size: 18,
                                        letter: -1,
                                        color: ColorStyles.black100,
                                      ),
                                    ),
                                  ),
                                  ODSvgImage(
                                    SvgImage.icCheck,
                                    size: 18,
                                    color: type == postType ? ColorStyles.red100 : ColorStyles.black40,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1.h,
                              color: ColorStyles.black10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
