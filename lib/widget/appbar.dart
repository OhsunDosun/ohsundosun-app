part of 'index.dart';

class ODMainAppBar extends ConsumerWidget {
  const ODMainAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: 54.h,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (ref.read(mainMBTIProvider) != null) {
                ref.read(mainMBTIProvider.notifier).update(null);
                ref.read(pagingProvider.notifier).load(type: LoadingType.reload);
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              padding: EdgeInsets.all(10.r),
              child: const ODPngImage(
                PngImage.mainLogo,
                height: 25,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.all(10.r),
            child: InkWell(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: const ODSvgImage(
                SvgImage.icMenu,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ODBackAppBar extends StatelessWidget {
  final String? text;
  final Widget right;

  const ODBackAppBar({
    super.key,
    this.text,
    this.right = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              context.pop();
            },
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: const ODSvgImage(
                SvgImage.icBack,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: (text != null)
                ? Text(
                    text!,
                    style: SpoqaHanSansNeo.bold.set(
                      size: 18,
                      height: 35,
                      letter: -1,
                      color: ColorStyles.black100,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          right
        ],
      ),
    );
  }
}
