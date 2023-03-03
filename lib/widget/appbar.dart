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
        height: 54,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  SvgImage.icBack,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
