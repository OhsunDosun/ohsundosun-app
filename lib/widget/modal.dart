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

class ODConfirmModal extends StatelessWidget {
  final String? text;
  final Widget? content;
  final String cancelText;
  final void Function()? onCancelTap;
  final String okText;
  final void Function()? onOkTap;

  const ODConfirmModal({
    this.text,
    this.content,
    this.cancelText = "취소",
    this.onCancelTap,
    this.okText = "확인",
    this.onOkTap,
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
                Row(
                  children: [
                    ODButton(
                      cancelText,
                      width: 95.w,
                      type: ODButtonType.black,
                      onTap: onCancelTap,
                    ),
                    ODWidth(10),
                    Expanded(
                      child: ODButton(
                        okText,
                        type: ODButtonType.red,
                        onTap: onOkTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
