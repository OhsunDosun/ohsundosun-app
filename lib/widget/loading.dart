part of 'index.dart';

class ODLoading extends StatelessWidget {
  const ODLoading({
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AbsorbPointer(
        child: Center(
          child: Container(
            height: 82.r,
            width: 82.r,
            decoration: BoxDecoration(color: ColorStyles.black.withOpacity(0.3), borderRadius: BorderRadius.circular(12.r)),
            child: Center(
              child: CupertinoActivityIndicator(
                color: ColorStyles.white,
                radius: 15.r,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
