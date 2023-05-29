import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/model/common/comment.dart';
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
class PostId extends _$PostId {
  @override
  String? build() => null;

  void update(String value) {
    state = value;
  }
}

@riverpod
class PostDetail extends _$PostDetail {
  @override
  Post? build() => null;

  Future<void> init() async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    state = await postsService.getPost(postId: postId!);

    ref.read(pagingProvider.notifier).load();
  }

  Future<void> refresh() async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    state = await postsService.getPost(postId: postId!);

    ref.read(pagingProvider.notifier).load(type: LoadingType.refresh);
  }
}

@riverpod
int limit(LimitRef ref) {
  return 20;
}

@riverpod
ScrollController scrollController(ScrollControllerRef ref) {
  return ScrollController();
}

@riverpod
void Function(String?) pageRequestListener(PageRequestListenerRef ref) {
  return (pageKey) async {
    await ref.read(pagingProvider.notifier).load(type: LoadingType.load, lastKey: pageKey);
  };
}

@riverpod
class Paging extends _$Paging {
  @override
  PagingController<String?, Comment> build() => PagingController(firstPageKey: null);

  Future<void> load({
    LoadingType type = LoadingType.init,
    String? lastKey,
  }) async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    final loading = ref.read(loadingProvider.notifier);

    final limit = ref.watch(limitProvider);

    if (type == LoadingType.refresh) {
      state.removePageRequestListener(ref.watch(pageRequestListenerProvider));
    }

    try {
      final comments = await postsService.getComments(
        postId: postId!,
        limit: limit,
        lastKey: lastKey,
      );

      if (comments.length < limit) {
        state.appendLastPage(comments);
      } else {
        state.appendPage(comments, comments.last.key);
        if (type == LoadingType.init || type == LoadingType.reload || type == LoadingType.refresh) {
          state.addPageRequestListener(ref.watch(pageRequestListenerProvider));
        }
      }

      if (type == LoadingType.init || type == LoadingType.reload) {
        loading.update(LoadingType.none);
      }
    } on String catch (error) {
      debugPrint(error);
      if (type == LoadingType.reload || type == LoadingType.refresh) {
        state.itemList = null;
        state.appendLastPage([]);
      }

      if (type == LoadingType.init || type == LoadingType.reload) {
        loading.update(LoadingType.none);
      }
    }
  }
}
