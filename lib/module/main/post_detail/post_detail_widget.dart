part of 'post_detail_view.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem(
    this.comment, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createdAt = comment.createdAt.unixTimestampToDateTime();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
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
                    DateFormat("yyyy.MM.dd").format(createdAt),
                    style: SpoqaHanSansNeo.regular.set(
                      size: 12,
                      height: 18,
                      color: ColorStyles.black40,
                    ),
                  ),
                  const Spacer(),
                ],
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
              )
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
