import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/widget/index.dart';

class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Stack(
        children: [
          ODSafeBox(
            top: true,
            child: Column(
              children: const [
                ODBackAppBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
