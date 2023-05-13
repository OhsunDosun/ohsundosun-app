part of 'index.dart';

enum ODButtonType {
  black,
  red,
  grey;

  Color toColor() {
    switch (this) {
      case ODButtonType.black:
        return ColorStyles.black100;
      case ODButtonType.red:
        return ColorStyles.red100;
      case ODButtonType.grey:
        return ColorStyles.black20;
    }
  }
}

class ODButton extends StatelessWidget {
  final ODButtonType type;
  final double? width;
  final bool enabled;
  final String text;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const ODButton(
    this.text, {
    super.key,
    this.type = ODButtonType.black,
    this.enabled = true,
    this.width,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ODButtonType buttonType = type;
    if (!enabled) {
      buttonType = ODButtonType.grey;
    }

    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 50.h,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: buttonType.toColor(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: SpoqaHanSansNeo.bold.set(
              color: ColorStyles.white,
              size: 16,
              height: 35,
              letter: -1,
            ),
          ),
        ),
      ),
    );
  }
}

class ODMBTIButton extends StatelessWidget {
  final MBTI mbti;
  final bool checked;
  final void Function()? onTap;

  const ODMBTIButton(
    this.mbti, {
    super.key,
    this.checked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 98.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: checked ? mbti.toCheckedColor() : ColorStyles.black5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mbti.toString(),
              style: SpoqaHanSansNeo.bold.set(
                size: 22,
                height: 35,
                color: checked ? ColorStyles.white : ColorStyles.black80,
              ),
            ),
            Text(
              mbti.toSubTitle(),
              style: SpoqaHanSansNeo.medium.set(
                size: 12,
                height: 18,
                letter: -1,
                color: checked ? ColorStyles.white : ColorStyles.black60,
              ),
            ),
            Text(
              mbti.toTitle(),
              style: SpoqaHanSansNeo.bold.set(
                size: 12,
                height: 18,
                letter: -1,
                color: checked ? ColorStyles.white : ColorStyles.black60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
