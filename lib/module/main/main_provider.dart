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
    final maxOffset = ref.watch(maxHeightProvider);

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
void Function(String?) pageRequestListener(PageRequestListenerRef ref) {
  return (pageKey) async {
    await ref.read(pagingProvider.notifier).load(type: LoadingType.load, lastKey: pageKey);
  };
}

@riverpod
class Paging extends _$Paging {
  @override
  PagingController<String?, Post> build() => PagingController(firstPageKey: null);

  Future<void> load({
    LoadingType type = LoadingType.init,
    String? lastKey,
  }) async {
    final scrollController = ref.read(scrollControllerProvider);
    final postsService = ref.read(postsServiceProvider);

    final loading = ref.read(loadingProvider.notifier);

    final limit = ref.watch(limitProvider);
    final sort = ref.watch(mainPostSortProvider);
    final postType = ref.watch(mainPostTypeProvider);
    final mbti = ref.watch(mainMBTIProvider);

    if (type == LoadingType.init || type == LoadingType.reload) {
      loading.update(true);
      ref.read(scrollOffsetProvider.notifier).update(0);
    }

    if (type == LoadingType.reload || type == LoadingType.refresh) {
      state.removePageRequestListener(ref.watch(pageRequestListenerProvider));
    }

    try {
      final posts = await postsService.getPosts(
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

      if (posts.length < limit) {
        state.appendLastPage(posts);
      } else {
        state.appendPage(posts, posts.last.key);
        if (type == LoadingType.init || type == LoadingType.reload || type == LoadingType.refresh) {
          state.addPageRequestListener(ref.watch(pageRequestListenerProvider));
        }
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


// Future<void> getPosts(
//   WidgetRef ref, {
//   LoadingType type = LoadingType.init,
//   String? lastKey,
// }) async {
// final scrollController = ref.read(scrollControllerProvider);
// final pagingController = ref.read(pagingControllerProvider);
// final postsService = ref.read(postsServiceProvider);

// final loading = ref.read(loadingProvider.notifier);

// final limit = ref.watch(limitProvider);
// final sort = ref.watch(mainPostSortProvider);
// final postType = ref.watch(mainPostTypeProvider);
// final mbti = ref.watch(mainMBTIProvider);

// if (type == LoadingType.init || type == LoadingType.reload) {
//   loading.update(true);
// }

// debugPrint(type.toString());

// debugPrint(pagingController.itemList?.length.toString());

// try {
//   final posts = await postsService.getPosts(
//     sort: sort,
//     limit: limit,
//     lastKey: lastKey,
//     type: postType,
//     mbti: mbti,
//   );

//   if (type == LoadingType.reload || type == LoadingType.refresh) {
//     pagingController.itemList = [];
//     scrollController.jumpTo(0);
//   }

//   if (posts.length < limit) {
//     pagingController.appendLastPage(posts);
//   } else {
//     pagingController.appendPage(posts, posts.last.key);
//   }

//   if (type == LoadingType.init || type == LoadingType.reload) {
//     loading.update(false);
//   }
// } on String catch (error) {
//   debugPrint(error);
//   if (type == LoadingType.reload || type == LoadingType.refresh) {
//     pagingController.itemList = null;
//     pagingController.appendLastPage([]);
//     scrollController.jumpTo(0);
//   }

//   if (type == LoadingType.init || type == LoadingType.reload) {
//     loading.update(false);
//   }
// }
// }
