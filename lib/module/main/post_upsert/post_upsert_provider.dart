import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/post_type.dart';
import 'package:ohsundosun/provider/app_provider.dart';
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
class Title extends _$Title {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
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
class Images extends _$Images {
  @override
  List<File> build() => [];

  void add(File value) {
    state = [...state, value];
  }

  void delete(File value) {
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

Future<void> upsertPost(
  BuildContext context,
  WidgetRef ref,
) async {
  FocusScope.of(context).unfocus();

  final postsService = ref.read(postsServiceProvider);

  final loading = ref.read(loadingProvider.notifier);

  final type = ref.watch(postWritePostTypeProvider);
  final title = ref.watch(titleProvider);
  final content = ref.watch(contentProvider);
  final images = ref.watch(imagesProvider);

  ref.read(accessTokenProvider.notifier).update(null);

  loading.update(true);

  try {
    await postsService.addPost(
      type: type,
      title: title,
      content: content,
      images: images,
    );

    loading.update(false);
    // ref.watch(routerProvider).pop();
  } on String catch (error) {
    debugPrint(error);

    loading.update(false);
  }
}
