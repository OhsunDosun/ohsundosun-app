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
  final void Function()? onTap;

  const ODButton(
    this.text, {
    super.key,
    this.type = ODButtonType.black,
    this.enabled = true,
    this.width,
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
