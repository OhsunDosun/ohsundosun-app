import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/image_category.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_type.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_upsert_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class PostWritePostType extends _$PostWritePostType {
  @override
  PostType build() => PostType.daily;

  void update(PostType value) {
    state = value;
  }
}

@riverpod
class PostWriteMBTI extends _$PostWriteMBTI {
  @override
  MBTI build() => ref.read(userInfoProvider).mbti;

  void update(MBTI value) {
    state = value;
  }
}

@riverpod
class Title extends _$Title {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
TextEditingController titleController(TitleControllerRef ref) {
  return TextEditingController();
}

@riverpod
class Content extends _$Content {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
TextEditingController contentController(ContentControllerRef ref) {
  return TextEditingController();
}

@riverpod
class Images extends _$Images {
  @override
  List<String> build() => [];

  void update(List<String> value) {
    state = value;
  }

  Future<void> add(File value) async {
    final imagesService = ref.read(imagesServiceProvider);

    final loading = ref.read(loadingProvider.notifier);

    loading.update(true);

    try {
      final images = await imagesService.addImage(
        category: ImageCategory.post,
        images: [value],
      );

      state = [...state, ...images];

      loading.update(false);
    } on String catch (error) {
      debugPrint(error);

      loading.update(false);
    }
  }

  void delete(String value) {
    final tmp = [...state];
    tmp.remove(value);
    state = tmp;
  }
}

@riverpod
bool upsertEnabled(UpsertEnabledRef ref) {
  final title = ref.watch(titleProvider);
  final content = ref.watch(contentProvider);

  if (title.isEmpty || content.isEmpty) {
    return false;
  }
  return true;
}

Future<void> getPost(
  WidgetRef ref, {
  required String postId,
}) async {
  final postsService = ref.read(postsServiceProvider);

  final loading = ref.read(loadingProvider.notifier);

  loading.update(true);

  final post = await postsService.getPost(postId: postId);

  ref.read(imagesProvider.notifier).update(post.images);
  ref.read(titleControllerProvider).text = post.title;
  ref.read(titleProvider.notifier).update(post.title);
  ref.read(contentControllerProvider).text = post.content;
  ref.read(contentProvider.notifier).update(post.content);
  ref.read(postWritePostTypeProvider.notifier).update(post.type);

  loading.update(false);
}

Future<void> upsertPost(
  BuildContext context,
  WidgetRef ref, {
  String? postId,
}) async {
  FocusScope.of(context).unFocus();

  final postsService = ref.read(postsServiceProvider);

  final loading = ref.read(loadingProvider.notifier);

  final type = ref.watch(postWritePostTypeProvider);
  final mbti = ref.watch(postWriteMBTIProvider);
  final title = ref.watch(titleProvider);
  final content = ref.watch(contentProvider);
  final images = ref.watch(imagesProvider);

  ref.read(accessTokenProvider.notifier).update(null);

  loading.update(true);

  try {
    if (postId != null) {
      await postsService.updatePost(
        postId: postId,
        type: type,
        title: title,
        content: content,
        images: images,
      );
    } else {
      await postsService.addPost(
        mbti: mbti,
        type: type,
        title: title,
        content: content,
        images: images,
      );
    }

    loading.update(false);
    ref.watch(routerProvider).pop(true);
  } on String catch (error) {
    debugPrint(error);

    loading.update(false);
  }
}
