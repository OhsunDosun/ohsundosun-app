import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        children: [
          SvgPicture.asset(
            'asset/image/ic_logo_register_complete.svg',
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }
}
