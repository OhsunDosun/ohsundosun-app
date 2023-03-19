part of 'index.dart';

class ODAlertModal extends StatelessWidget {
  final String? text;
  final Widget? content;
  final String buttonText;
  final void Function()? onTap;

  const ODAlertModal({
    this.text,
    this.content,
    this.buttonText = "확인",
    this.onTap,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: ColorStyles.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Material(
            color: ColorStyles.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 49.h, bottom: 55.h),
                  child: content ??
                      Text(
                        text ?? "",
                        textAlign: TextAlign.center,
                        style: SpoqaHanSansNeo.regular.set(
                          size: 18,
                          height: 15,
                          letter: -1,
                          color: ColorStyles.black100,
                        ),
                      ),
                ),
                ODButton(
                  buttonText,
                  type: ODButtonType.red,
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
