import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_sort.dart';
import 'package:ohsundosun/enum/post_type.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
int limit(LimitRef ref) {
  return 20;
}

@riverpod
class MainMBTI extends _$MainMBTI {
  @override
  MBTI? build() => null;

  void update(MBTI? value) {
    state = value;
  }
}

@riverpod
class MainPostType extends _$MainPostType {
  @override
  PostType? build() => null;

  void update(PostType? value) {
    state = value;
  }
}

@riverpod
class MainPostSort extends _$MainPostSort {
  @override
  PostSort build() => PostSort.newPost;

  void update(PostSort value) {
    state = value;
  }
}

@riverpod
ScrollController scrollController(ScrollControllerRef ref) {
  return ScrollController();
}

@riverpod
double maxHeight(MaxHeightRef ref) {
  return (ref.watch(mainMBTIProvider) == null ? 201.h : 232.h) - 99.h;
}

@riverpod
class ScrollOffset extends _$ScrollOffset {
  @override
  double build() => 0;

  void update(double value) {
    final maxOffset = ref.read(maxHeightProvider);

    double offset = value;

    if (offset < 0) {
      offset = 0;
    } else if (offset > maxOffset) {
      offset = maxOffset;
    }

    state = offset;
  }
}

@riverpod
double appbarShadowOpacity(AppbarShadowOpacityRef ref) {
  final Tween<double> appbarShadowOpacityTween = Tween(begin: 0, end: 0.05);
  return appbarShadowOpacityTween.transform(ref.watch(scrollOffsetProvider) / ref.watch(maxHeightProvider));
}

@riverpod
double sortOpacity(SortOpacityRef ref) {
  return ref.watch(scrollOffsetProvider) / ref.watch(maxHeightProvider);
}

@riverpod
double mbtiOpacity(MbtiOpacityRef ref) {
  return 1 - ref.watch(scrollOffsetProvider) / ref.watch(maxHeightProvider);
}

@riverpod
double sortPaddingLeft(SortPaddingLeftRef ref) {
  final Tween<double> sortPaddingLeftTween = Tween(begin: 0.w, end: 33.w);
  return sortPaddingLeftTween.transform(ref.watch(scrollOffsetProvider) / ref.watch(maxHeightProvider));
}

@riverpod
void Function(int?) pageRequestListener(PageRequestListenerRef ref) {
  return (pageKey) async {
    await ref.read(pagingProvider.notifier).load(type: LoadingType.load, lastKey: pageKey);
  };
}

@riverpod
class LikeCancelableOperation extends _$LikeCancelableOperation {
  @override
  CancelableOperation<bool>? build() => null;

  void update(CancelableOperation<bool> value) {
    state = value;
  }
}

@riverpod
class Paging extends _$Paging {
  @override
  PagingController<int?, PostUI> build() => PagingController(firstPageKey: null);

  Future<void> onLike({
    required String postId,
    required bool value,
  }) async {
    final postsService = ref.read(postsServiceProvider);
    final likeCancelableOperation = ref.read(likeCancelableOperationProvider);
    likeCancelableOperation?.cancel();

    final newLikeCancelableOperation = CancelableOperation.fromFuture(
      postsService.likePost(
        postId: postId,
        like: value,
      ),
    ).then(
      (_) {
        state.itemList = state.itemList?.map((item) {
          if (item.uuid == postId) {
            return item.copyWith(isLike: value, likeCount: value ? item.likeCount + 1 : item.likeCount - 1);
          } else {
            return item;
          }
        }).toList();

        return value;
      },
    );
    ref.read(likeCancelableOperationProvider.notifier).update(newLikeCancelableOperation);
  }

  Future<void> load({
    LoadingType type = LoadingType.init,
    int? lastKey,
  }) async {
    final scrollController = ref.read(scrollControllerProvider);
    final postsService = ref.read(postsServiceProvider);

    final loading = ref.read(loadingProvider.notifier);

    final limit = ref.read(limitProvider);
    final sort = ref.read(mainPostSortProvider);
    final postType = ref.read(mainPostTypeProvider);
    final mbti = ref.read(mainMBTIProvider);

    if (type == LoadingType.init || type == LoadingType.reload) {
      loading.update(true);
      ref.read(scrollOffsetProvider.notifier).update(0);
    }

    if (type == LoadingType.reload || type == LoadingType.refresh) {
      state.removePageRequestListener(ref.read(pageRequestListenerProvider));
    }

    try {
      final postPaging = await postsService.getPosts(
        sort: sort,
        limit: limit,
        lastKey: lastKey,
        type: postType,
        mbti: mbti,
      );

      if (type == LoadingType.reload || type == LoadingType.refresh) {
        state.itemList = [];
        scrollController.jumpTo(0);
      }

      if (postPaging.lastKey != null) {
        state.appendPage(postPaging.list, postPaging.lastKey);
        if (type == LoadingType.init || type == LoadingType.reload || type == LoadingType.refresh) {
          state.addPageRequestListener(ref.read(pageRequestListenerProvider));
        }
      } else {
        state.appendLastPage(postPaging.list);
      }

      if (type == LoadingType.init || type == LoadingType.reload) {
        loading.update(false);
      }
    } on String catch (error) {
      debugPrint(error);
      if (type == LoadingType.reload || type == LoadingType.refresh) {
        state.itemList = null;
        state.appendLastPage([]);
        scrollController.jumpTo(0);
      }

      if (type == LoadingType.init || type == LoadingType.reload) {
        loading.update(false);
      }
    }
  }
}
