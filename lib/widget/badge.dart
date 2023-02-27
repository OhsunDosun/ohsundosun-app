import 'package:flutter/material.dart';
import 'package:ohsundosun/style/color_styles.dart';
import 'package:ohsundosun/style/text_styles.dart';

enum ODBadgeType {
  white,
  purple,
  blue,
  green,
  orange;

  Color toColor() {
    switch (this) {
      case ODBadgeType.white:
        return ColorStyles.white;
      case ODBadgeType.purple:
        return ColorStyles.purple10;
      case ODBadgeType.blue:
        return ColorStyles.blue10;
      case ODBadgeType.green:
        return ColorStyles.green10;
      case ODBadgeType.orange:
        return ColorStyles.orange10;
    }
  }

  Color toTextColor() {
    switch (this) {
      case ODBadgeType.white:
        return ColorStyles.black80;
      case ODBadgeType.purple:
        return ColorStyles.purpleDeep;
      case ODBadgeType.blue:
        return ColorStyles.blueDeep;
      case ODBadgeType.green:
        return ColorStyles.greenDeep;
      case ODBadgeType.orange:
        return ColorStyles.orangeDeep;
    }
  }
}

class ODBadge extends StatelessWidget {
  final ODBadgeType type;
  final String text;
  final void Function()? onTap;

  const ODBadge(
    this.text, {
    super.key,
    this.type = ODBadgeType.white,
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
          height: 20,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: type.toColor(),
            borderRadius: BorderRadius.circular(5),
            border: type == ODBadgeType.white
                ? Border.all(
                    width: 1,
                    color: ColorStyles.black20,
                  )
                : null,
          ),
          child: Center(
            child: Text(
              text,
              style: (type == ODBadgeType.white ? TextStyles.medium : TextStyles.bold).copyWith(
                color: type.toTextColor(),
                fontSize: 11,
                letterSpacing: -1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
