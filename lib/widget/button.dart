import 'package:flutter/material.dart';
import 'package:ohsundosun/style/color_styles.dart';

enum ButtonType {
  black,
  red,
  grey;

  Color toColor() {
    switch (this) {
      case ButtonType.black:
        return ColorStyles.black100;
      case ButtonType.red:
        return ColorStyles.red100;
      case ButtonType.grey:
        return ColorStyles.black20;
    }
  }
}

class Button extends StatelessWidget {
  final ButtonType type;
  final String text;
  final void Function()? onTap;

  const Button({
    super.key,
    this.type = ButtonType.black,
    this.text = "",
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
          height: 50,
          decoration: BoxDecoration(
            color: type.toColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: ColorStyles.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
