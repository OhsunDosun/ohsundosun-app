part of 'index.dart';

class ODSafeBox extends SafeArea {
  const ODSafeBox({
    super.key,
    super.left = false,
    super.top = false,
    super.right = false,
    super.bottom = false,
    super.minimum,
    super.maintainBottomViewPadding,
    super.child = const SizedBox.shrink(),
  });
}

class ODSafeColumn extends Column {
  final bool top;
  final bool bottom;

  ODSafeColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    required List<Widget> children,
    this.top = false,
    this.bottom = false,
  }) : super(
          children: [
            if (top) const ODSafeBox(top: true),
            ...children,
            if (bottom) const ODSafeBox(bottom: true),
          ],
        );
}
