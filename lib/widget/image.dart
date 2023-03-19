part of 'index.dart';

class ODPngImage extends StatelessWidget {
  final String assetName;
  final double? size;
  final double? height;
  final double? width;
  final BoxFit fit;

  const ODPngImage(
    this.assetName, {
    super.key,
    this.size,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      height: size != null ? size!.r : height?.h,
      width: size != null ? size!.r : width?.w,
      fit: fit,
    );
  }
}

class ODSvgImage extends StatelessWidget {
  final String assetName;
  final double? size;
  final double? height;
  final double? width;
  final BoxFit fit;

  const ODSvgImage(
    this.assetName, {
    super.key,
    this.size,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: size != null ? size!.r : height?.h,
      width: size != null ? size!.r : width?.w,
      fit: fit,
    );
  }
}
