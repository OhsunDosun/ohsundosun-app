import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/widget/index.dart';

class PostWriteView extends ConsumerWidget {
  const PostWriteView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Stack(
        children: [
          ODSafeBox(
            top: true,
            child: Column(
              children: const [
                ODBackAppBar(
                  text: "게시글 작성",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
