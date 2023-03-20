part of 'setting_view.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final Widget? right;
  final void Function()? onTap;

  const SettingItem(
    this.text, {
    super.key,
    this.right,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 55.h,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: SpoqaHanSansNeo.regular.set(
                        size: 15,
                        height: 22.5,
                        letter: -1,
                        color: ColorStyles.black100,
                      ),
                    ),
                  ),
                  right != null
                      ? right!
                      : const ODSvgImage(
                          SvgImage.arriwRight,
                          size: 10,
                        ),
                ],
              ),
            ),
            Container(
              height: 1.h,
              color: ColorStyles.black10,
            )
          ],
        ),
      ),
    );
  }
}
