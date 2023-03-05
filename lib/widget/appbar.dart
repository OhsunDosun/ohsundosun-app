part of 'index.dart';

class ODBackAppBar extends StatelessWidget {
  const ODBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: SizedBox(
        height: 54.h,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  SvgImage.icBack,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
