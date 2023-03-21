part of 'index.dart';

class ODInput extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? errorText;
  final bool obscureText;

  const ODInput({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorStyles.black20, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorStyles.black20, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorStyles.black100, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 16.h,
            ),
            hintText: hintText,
            hintStyle: SpoqaHanSansNeo.regular.set(
              size: 15,
              height: 20,
              letter: -1,
              color: ColorStyles.black40,
            ),
          ),
          cursorColor: ColorStyles.black100,
          style: SpoqaHanSansNeo.regular.set(
            size: 15,
            height: 20,
            letter: -1,
            color: ColorStyles.black100,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          height: errorText?.isEmpty ?? true ? 0.h : 35.h,
          child: ClipRect(
            child: Wrap(
              children: [
                Column(
                  children: [
                    Container(
                      height: 35.h,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        errorText ?? '',
                        style: SpoqaHanSansNeo.medium.set(
                          size: 13,
                          height: 35,
                          letter: -1,
                          color: ColorStyles.messageError,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
