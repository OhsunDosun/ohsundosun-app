part of '../index.dart';

class ODMBTIBottomSheet extends StatelessWidget {
  final String? text;
  final Widget? content;
  final String buttonText;
  final void Function()? onTap;

  const ODMBTIBottomSheet({
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
                  padding: EdgeInsets.only(top: 39.h, bottom: 45.h, left: 10.w, right: 10.w),
                  child: content ??
                      Text(
                        text ?? "",
                        textAlign: TextAlign.center,
                        style: SpoqaHanSansNeo.medium.set(
                          size: 18,
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
