part of 'index.dart';

class ODSwitch extends HookWidget {
  final bool value;
  final void Function(bool value) onChange;

  const ODSwitch({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    final animation = useAnimationController(
      initialValue: value ? 1.0 : 0.0,
      duration: duration,
    );

    final Animation toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      ),
    );

    useEffect(() {
      if (value) {
        animation.forward();
      } else {
        animation.reverse();
      }

      return null;
    }, [value]);

    return InkWell(
      onTap: () => onChange(!value),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return AnimatedContainer(
            duration: duration,
            height: 22.h,
            width: 50.w,
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: value ? ColorStyles.red100 : ColorStyles.black40,
            ),
            child: Stack(
              children: [
                AnimatedOpacity(
                  duration: duration,
                  opacity: value ? 1 : 0,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Text(
                      "ON",
                      style: SpoqaHanSansNeo.medium.set(
                        size: 10,
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: duration,
                  opacity: value ? 0 : 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Text(
                      "OFF",
                      style: SpoqaHanSansNeo.medium.set(
                        size: 10,
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: toggleAnimation.value,
                  child: Container(
                    height: 14.r,
                    width: 14.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorStyles.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyles.black.withOpacity(0.15),
                          blurRadius: 4.39.r,
                          offset: Offset(0, 1.65.h),
                        ),
                        BoxShadow(
                          color: ColorStyles.black.withOpacity(0.06),
                          blurRadius: 0.55.r,
                          offset: Offset(0, 1.65.h),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
