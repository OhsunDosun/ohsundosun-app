part of 'index.dart';

class ODMainAppBar extends ConsumerWidget {
  const ODMainAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  PngImage.mainLogo,
                  width: 50.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            InkWell(
              onTap: () => onSignOut(ref),
              child: const Text("로그아웃"),
            )
          ],
        ),
      ),
    );
  }
}

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
              onTap: () => context.pop(),
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
