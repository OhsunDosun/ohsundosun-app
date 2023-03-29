import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/widget/index.dart';

class PostDetailView extends ConsumerWidget {
  final String? id;

  const PostDetailView({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Stack(
        children: [
          ODSafeBox(
            top: true,
            child: Column(
              children: [
                ODBackAppBar(
                  right: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: const ODSvgImage(
                        SvgImage.icDot,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
