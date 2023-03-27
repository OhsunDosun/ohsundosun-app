part of 'main_view.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem(
    this.post, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createdAt = post.createdAt.unixTimestampToDateTime();

    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.only(top: 15.h, bottom: 18.h, left: 20.w, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorStyles.white,
        boxShadow: [
          BoxShadow(
            color: ColorStyles.black100.withOpacity(0.05),
            offset: Offset(0, 6.h),
            blurRadius: 20.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ODBadge(
                post.mbti.toString(),
                type: post.mbti.toODBadgeType(),
              ),
              ODWidth(5),
              ODBadge(post.type.toString()),
            ],
          ),
          ODHeight(14),
          Text(
            post.title,
            style: SpoqaHanSansNeo.bold.set(
              size: 18,
              height: 27,
              letter: -1,
              color: ColorStyles.black100,
            ),
          ),
          ODHeight(6),
          Text(
            post.content.length > 200 ? "${post.content.substring(0, 199)}..." : post.content,
            style: SpoqaHanSansNeo.regular.set(
              size: 15,
              height: 22.5,
              letter: -1,
              color: ColorStyles.black80,
            ),
          ),
          ODHeight(15),
          Row(
            children: [
              const ODSvgImage(
                SvgImage.icLikeOff,
                size: 20,
              ),
              ODWidth(5),
              Text(
                post.likeCount.toString(),
                style: SpoqaHanSansNeo.medium.set(
                  size: 12,
                  height: 18,
                  letter: -1,
                  color: ColorStyles.black60,
                ),
              ),
              ODWidth(10),
              const ODSvgImage(
                SvgImage.icComment,
                size: 20,
              ),
              ODWidth(5),
              Text(
                post.commentCount.toString(),
                style: SpoqaHanSansNeo.medium.set(
                  size: 12,
                  height: 18,
                  letter: -1,
                  color: ColorStyles.black60,
                ),
              ),
              const Spacer(),
              Text(
                post.nickname,
                style: SpoqaHanSansNeo.medium.set(
                  size: 12,
                  height: 18,
                  letter: -1,
                  color: ColorStyles.black60,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 2.r,
                width: 2.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorStyles.black40,
                ),
              ),
              Text(
                DateTime.now().difference(createdAt) <= const Duration(minutes: 10)
                    ? DateFormat('m분전').format(createdAt)
                    : DateFormat('yy.MM.dd').format(createdAt),
                style: SpoqaHanSansNeo.medium.set(
                  size: 12,
                  height: 18,
                  color: ColorStyles.black40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MBTIMenu extends HookConsumerWidget {
  final String icon;
  final String title;
  final String subTitle;
  final List<MBTI> items;

  const MBTIMenu({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = useState(false);

    final lotateAnimation = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    useAnimation(lotateAnimation);

    return Column(
      children: [
        InkWell(
          onTap: () {
            if (!isOpen.value) {
              lotateAnimation.forward();
            } else {
              lotateAnimation.reverse();
            }

            isOpen.value = !isOpen.value;
          },
          child: Container(
            height: 55.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                ODSvgImage(
                  icon,
                  size: 18,
                ),
                ODWidth(5),
                Text(
                  title,
                  style: SpoqaHanSansNeo.bold.set(
                    size: 18,
                    letter: -1,
                    color: ColorStyles.black100,
                  ),
                ),
                ODWidth(5),
                Text(
                  "/ $subTitle",
                  style: SpoqaHanSansNeo.regular.set(
                    size: 15,
                    color: ColorStyles.black40,
                  ),
                ),
                const Spacer(),
                RotationTransition(
                  turns: Tween(begin: -0.5, end: 0.0).animate(lotateAnimation),
                  child: const ODSvgImage(
                    SvgImage.arrowDown15,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          height: isOpen.value ? 200.h : 0.h,
          child: ClipRect(
            child: Wrap(
              children: [
                Column(
                  children: items.asMap().entries.map(
                    (data) {
                      final index = data.key;
                      final item = data.value;

                      return InkWell(
                        onTap: () {
                          ref.read(mainMBTIProvider.notifier).update(item);
                          context.pop();
                        },
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          color: ColorStyles.black10.withOpacity(0.3),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned.fill(
                                child: Row(
                                  children: [
                                    Text(
                                      item.toString(),
                                      style: SpoqaHanSansNeo.bold.set(
                                        size: 15,
                                        height: 20,
                                        color: ColorStyles.black80,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                                      height: 3.r,
                                      width: 3.r,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorStyles.black20,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${item.toSubTitle()} ${item.toTitle()}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: SpoqaHanSansNeo.medium.set(
                                          size: 12,
                                          height: 20,
                                          letter: -1,
                                          color: ColorStyles.black60,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (index != items.length - 1)
                                Container(
                                  height: 1.h,
                                  color: ColorStyles.black10,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
