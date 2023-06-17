import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/model/common/comment.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/provider/router_provider.dart';
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
class LikeCancelableOperation extends _$LikeCancelableOperation {
  @override
  CancelableOperation<bool>? build() => null;

  void update(CancelableOperation<bool> value) {
    state = value;
  }
}

@riverpod
class PostDetail extends _$PostDetail {
  @override
  PostUI? build() => null;

  Future<void> init(BuildContext context) async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    try {
      state = await postsService.getPost(postId: postId ?? "");

      await ref.read(pagingProvider.notifier).load();
    } on String catch (errorCode) {
      late String errorText;

      switch (errorCode) {
        default:
          errorText = "알 수 없는 에러가 발생했습니다.";
          break;
      }

      showDialog(
        context: context,
        builder: (context) {
          return ODAlertModal(
            text: errorText,
            onTap: () {
              context.pop();
              context.pop();
            },
          );
        },
      );
    }
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

  Future<void> report(
    BuildContext context, {
    String? commentId,
  }) async {
    final loading = ref.read(loadingProvider.notifier);

    final postService = ref.read(postsServiceProvider);

    loading.update(LoadingType.load);
    try {
      if (commentId != null) {
        await postService.reportComment(
          postId: state?.uuid ?? "",
          commentId: commentId,
        );
      } else {
        await postService.reportPost(
          postId: state?.uuid ?? "",
        );
      }

      loading.update(LoadingType.none);
    } on String catch (errorCode) {
      loading.update(LoadingType.none);

      late String errorText;

      switch (errorCode) {
        default:
          errorText = "알 수 없는 에러가 발생했습니다.";
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

  Future<void> delete(
    BuildContext context, {
    String? commentId,
  }) async {
    final loading = ref.read(loadingProvider.notifier);

    final postService = ref.read(postsServiceProvider);

    loading.update(LoadingType.load);
    try {
      if (commentId != null) {
        await postService.deleteComment(
          postId: state?.uuid ?? "",
          commentId: commentId,
        );

        await reload();
      } else {
        await postService.deletePost(
          postId: state?.uuid ?? "",
        );

        loading.update(LoadingType.none);
        ref.read(routerProvider).pop(true);
      }
    } on String catch (errorCode) {
      loading.update(LoadingType.none);

      late String errorText;

      switch (errorCode) {
        default:
          errorText = "알 수 없는 에러가 발생했습니다.";
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

  Future<void> onLike({
    required bool value,
  }) async {
    final post = state;

    if (post == null) {
      return;
    }

    final postsService = ref.read(postsServiceProvider);
    final likeCancelableOperation = ref.read(likeCancelableOperationProvider);
    likeCancelableOperation?.cancel();

    final newLikeCancelableOperation = CancelableOperation.fromFuture(
      postsService.likePost(
        postId: post.uuid,
        like: value,
      ),
    ).then(
      (_) {
        state = post.copyWith(isLike: value, likeCount: value ? post.likeCount + 1 : post.likeCount - 1);

        return value;
      },
    );
    ref.read(likeCancelableOperationProvider.notifier).update(newLikeCancelableOperation);
  }

  Future<void> onAddComment(BuildContext context) async {
    FocusScope.of(context).unFocus();

    final loading = ref.read(loadingProvider.notifier);

    try {
      loading.update(LoadingType.load);

      final postService = ref.read(postsServiceProvider);

      final commentId = ref.read(commentIdProvider);
      final comment = ref.read(postDetailCommentProvider);

      if (commentId != null) {
        await postService.addCommentReply(
          postId: state?.uuid ?? "",
          commentId: commentId,
          content: comment,
        );
      } else {
        await postService.addComment(
          postId: state?.uuid ?? "",
          content: comment,
        );
      }

      await reload();
      ref.read(postDetailCommentProvider.notifier).reset();

      loading.update(LoadingType.none);
    } on String catch (errorCode) {
      loading.update(LoadingType.none);

      late String errorText;

      switch (errorCode) {
        default:
          errorText = "알 수 없는 에러가 발생했습니다.";
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
}

@riverpod
int limit(LimitRef ref) {
  return 20;
}

@riverpod
void Function(int?) pageRequestListener(PageRequestListenerRef ref) {
  return (pageKey) async {
    await ref.read(pagingProvider.notifier).load(type: LoadingType.load, lastKey: pageKey);
  };
}

@riverpod
class Paging extends _$Paging {
  @override
  PagingController<int?, CommentUI> build() => PagingController(firstPageKey: null);

  Future<void> load({
    LoadingType type = LoadingType.init,
    int? lastKey,
  }) async {
    final postId = ref.read(postIdProvider);
    final postsService = ref.read(postsServiceProvider);

    final loading = ref.read(loadingProvider.notifier);

    final limit = ref.read(limitProvider);

    if (type == LoadingType.reload || type == LoadingType.refresh) {
      state.removePageRequestListener(ref.read(pageRequestListenerProvider));
    }

    try {
      final commentPaging = await postsService.getComments(
        postId: postId!,
        limit: limit,
        lastKey: lastKey,
      );

      if (type == LoadingType.reload || type == LoadingType.refresh) {
        state.itemList = [];
      }

      if (commentPaging.lastKey != null) {
        state.appendPage(commentPaging.list, commentPaging.lastKey);
        if (type == LoadingType.init || type == LoadingType.reload || type == LoadingType.refresh) {
          state.addPageRequestListener(ref.read(pageRequestListenerProvider));
        }
      } else {
        state.appendLastPage(commentPaging.list);
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
