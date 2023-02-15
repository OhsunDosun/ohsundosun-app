import 'package:flutter/material.dart';
import 'package:ohsundosun/style/color_style.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;

  const Input({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorStyle.black20, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorStyle.black100, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorStyle.black40,
        ),
      ),
      cursorColor: ColorStyle.black100,
      style: const TextStyle(
        color: ColorStyle.black100,
      ),
    );
  }
}
