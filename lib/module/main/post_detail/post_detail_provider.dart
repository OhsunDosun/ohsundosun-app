import 'package:flutter/material.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_detail_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  LoadingType build() => LoadingType.init;

  void update(LoadingType value) {
    state = value;
  }
}

@riverpod
class PostDetail extends _$PostDetail {
  @override
  Post? build() => null;

  Future<void> load(String id) async {
    final loading = ref.read(loadingProvider.notifier);
    final postsService = ref.read(postsServiceProvider);

    if (ref.read(loadingProvider) != LoadingType.init) {
      loading.update(LoadingType.refresh);
    }

    try {
      state = await postsService.getPost(postId: id);

      loading.update(LoadingType.none);
    } on String catch (error) {
      debugPrint(error);

      loading.update(LoadingType.none);
    }
  }
}
