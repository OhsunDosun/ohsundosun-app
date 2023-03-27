import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
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
PagingController<String?, Post> pagingController(PagingControllerRef ref) {
  return PagingController(firstPageKey: null);
}

Future<void> getPosts(
  WidgetRef ref, {
  String? lastKey,
}) async {
  final pagingController = ref.read(pagingControllerProvider);
  final postsService = ref.read(postsServiceProvider);

  final loading = ref.read(loadingProvider.notifier);

  final limit = ref.watch(limitProvider);
  final sort = ref.watch(mainPostSortProvider);
  final type = ref.watch(mainPostTypeProvider);
  final mbti = ref.watch(mainMBTIProvider);

  final isEmpty = pagingController.value.itemList?.isEmpty ?? true;

  if (isEmpty) {
    loading.update(true);
  }

  final posts = await postsService.getPosts(
    sort: sort,
    limit: limit,
    lastKey: lastKey,
    type: type,
    mbti: mbti,
  );

  if (posts.length < limit) {
    pagingController.appendLastPage(posts);
  } else {
    pagingController.appendPage(posts, posts.last.key);
  }

  if (isEmpty) {
    loading.update(false);
  }
}
