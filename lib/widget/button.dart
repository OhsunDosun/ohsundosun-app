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
  final String text;
  final void Function()? onTap;

  const ODButton(
    this.text, {
    super.key,
    this.type = ODButtonType.black,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: type.toColor(),
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
      ),
    );
  }
}
