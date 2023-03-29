part of 'user_info_view.dart';

class InfoItem extends StatelessWidget {
  final String text;
  final Widget right;
  final void Function()? onTap;

  const InfoItem(
    this.text, {
    super.key,
    this.right = const SizedBox.shrink(),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 65.h,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: SpoqaHanSansNeo.bold.set(
                      size: 18,
                      height: 27,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  ),
                ),
                right,
                ODWidth(11),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 28.h,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(width: 1.r, color: ColorStyles.black10),
                    ),
                    child: Center(
                      child: Text(
                        "수정하기",
                        style: SpoqaHanSansNeo.regular.set(
                          size: 13,
                          letter: -1,
                          color: ColorStyles.black60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 6.h,
            color: ColorStyles.black5,
          )
        ],
      ),
    );
  }
}
