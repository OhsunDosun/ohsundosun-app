part of 'post_detail_view.dart';

class CommentItem extends ConsumerWidget {
  final Comment comment;

  const CommentItem(
    this.comment, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReply = comment.level > 0;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Row(
            children: [
              if (isReply) ...[
                const ODSvgImage(
                  SvgImage.icReply,
                  size: 10,
                ),
                ODWidth(8),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Row(
                        children: [
                          ODBadge(
                            comment.mbti.toString(),
                            type: comment.mbti.toODBadgeType(),
                          ),
                          ODWidth(5),
                          Text(
                            comment.nickname,
                            style: SpoqaHanSansNeo.regular.set(
                              size: 12,
                              height: 18,
                              letter: -1,
                              color: ColorStyles.black60,
                            ),
                          ),
                          ODWidth(5),
                          Container(
                            height: 2.r,
                            width: 2.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorStyles.black40,
                            ),
                          ),
                          ODWidth(5),
                          Text(
                            DateFormat("yyyy.MM.dd").format(comment.createdAt),
                            style: SpoqaHanSansNeo.regular.set(
                              size: 12,
                              height: 18,
                              color: ColorStyles.black40,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const ODSvgImage(
                              SvgImage.icDotCircle,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    ODHeight(8),
                    Text(
                      comment.content,
                      style: SpoqaHanSansNeo.regular.set(
                        size: 13,
                        height: 19.5,
                        letter: -1,
                        color: ColorStyles.black100,
                      ),
                    ),
                    if (!isReply) ...[
                      ODHeight(2),
                      InkWell(
                        onTap: () {
                          ref.read(commentIdProvider.notifier).update(comment.uuid);
                          ref.read(postDetailCommentFocusNodeProvider).requestFocus();
                        },
                        child: Text(
                          "답글달기",
                          style: SpoqaHanSansNeo.medium.set(
                            size: 12,
                            height: 18,
                            letter: -1,
                            color: ColorStyles.black40,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.h,
          color: ColorStyles.black10,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
        ),
      ],
    );
  }
}
