import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ohsundosun/util/image.dart';

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
                  Svgs.back,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
