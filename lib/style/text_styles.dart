part of 'index.dart';

class SpoqaHanSansNeo {
  SpoqaHanSansNeo._();

  static const thin = TextStyle(
    fontFamily: "SpoqaHanSansNeo",
    fontWeight: FontWeight.w100,
  );

  static const light = TextStyle(
    fontFamily: "SpoqaHanSansNeo",
    fontWeight: FontWeight.w300,
  );

  static const regular = TextStyle(
    fontFamily: "SpoqaHanSansNeo",
    fontWeight: FontWeight.w400,
  );

  static const medium = TextStyle(
    fontFamily: "SpoqaHanSansNeo",
    fontWeight: FontWeight.w500,
  );

  static const bold = TextStyle(
    fontFamily: "SpoqaHanSansNeo",
    fontWeight: FontWeight.w700,
  );
}

extension DoubleExtension on double {
  double toFigmaLineHeight(double fontSize) {
    return this / fontSize;
  }
}

extension IntExtension on int {
  double toFigmaLineHeight(int fontSize) {
    return this / fontSize;
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle set({
    required double size,
    double? height,
    Color? color,
    double? letter,
    TextDecoration? decoration,
  }) {
    return copyWith(
      fontSize: size.sp,
      height: height?.toFigmaLineHeight(size) ?? 1,
      leadingDistribution: TextLeadingDistribution.even,
      color: color,
      letterSpacing: letter,
      decoration: decoration,
    );
  }
}
