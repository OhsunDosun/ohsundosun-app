import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/model/common/comment.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/widget/index.dart';
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
class CommentId extends _$CommentId {
  @override
  String? build() => null;

  void update(String? value) {
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

    await ref.read(pagingProvider.notifier).load();
  }

  Future<void> reload() async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    ref.read(loadingProvider.notifier).update(LoadingType.load);
    ref.read(scrollControllerProvider).jumpTo(0);

    state = await postsService.getPost(postId: postId!);

    await ref.read(pagingProvider.notifier).load(type: LoadingType.reload);
  }

  Future<void> refresh() async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    state = await postsService.getPost(postId: postId!);

    await ref.read(pagingProvider.notifier).load(type: LoadingType.refresh);
  }
}

@riverpod
int limit(LimitRef ref) {
  return 20;
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

    final limit = ref.read(limitProvider);

    if (type == LoadingType.reload || type == LoadingType.refresh) {
      state.removePageRequestListener(ref.read(pageRequestListenerProvider));
    }

    try {
      final comments = await postsService.getComments(
        postId: postId!,
        limit: limit,
        lastKey: lastKey,
      );

      if (type == LoadingType.reload || type == LoadingType.refresh) {
        state.itemList = [];
      }

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
      if (type == LoadingType.init || type == LoadingType.reload || type == LoadingType.refresh) {
        state.itemList = null;
        state.appendLastPage([]);
      }

      if (type == LoadingType.init || type == LoadingType.reload) {
        loading.update(LoadingType.none);
      }
    }
  }
}

@riverpod
TextEditingController postDetailCommentController(PostDetailCommentControllerRef ref) {
  return TextEditingController();
}

@riverpod
FocusNode postDetailCommentFocusNode(PostDetailCommentFocusNodeRef ref) {
  return FocusNode();
}

@riverpod
ScrollController scrollController(ScrollControllerRef ref) {
  return ScrollController();
}

@riverpod
class PostDetailComment extends _$PostDetailComment {
  @override
  String build() => "";

  void reset() {
    state = "";
    ref.read(postDetailCommentControllerProvider).clear();
    ref.read(postDetailCommentProvider.notifier).update("");
    ref.read(commentIdProvider.notifier).update(null);
    ref.read(scrollControllerProvider).jumpTo(0);
  }

  void update(String value) {
    state = value;
  }
}

Future<void> onAddComment(BuildContext context, WidgetRef ref) async {
  FocusScope.of(context).unFocus();

  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(LoadingType.load);

    final postService = ref.read(postsServiceProvider);

    final postId = ref.read(postIdProvider);
    final commentId = ref.read(commentIdProvider);
    final comment = ref.read(postDetailCommentProvider);

    if (commentId != null) {
      await postService.addCommentReply(
        postId: postId!,
        commentId: commentId,
        content: comment,
      );
    } else {
      await postService.addComment(
        postId: postId!,
        content: comment,
      );
    }

    await ref.read(pagingProvider.notifier).load(type: LoadingType.reload);
    ref.read(postDetailCommentProvider.notifier).reset();

    loading.update(LoadingType.none);
  } on String catch (errorCode) {
    loading.update(LoadingType.none);

    late String errorText;

    switch (errorCode) {
      default:
        errorText = "알 수 없는 에러가 발생헀습니다.";
        break;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ODAlertModal(
          text: errorText,
          onTap: () => context.pop(),
        );
      },
    );
  }
}
