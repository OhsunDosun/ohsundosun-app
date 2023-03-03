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
