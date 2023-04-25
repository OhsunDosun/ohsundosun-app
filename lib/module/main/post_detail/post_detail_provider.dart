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

  Future<void> init(String id) async {
    state = LoadingType.init;
    await ref.read(postDetailProvider.notifier).load(id);
    state = LoadingType.none;
  }
}

@riverpod
class PostDetail extends _$PostDetail {
  @override
  Post? build() => null;

  Future<void> load(String id) async {
    final postsService = ref.read(postsServiceProvider);

    state = await postsService.getPost(postId: id);
  }
}

@riverpod
class PostComments extends _$PostComments {
  @override
  Post? build() => null;

  Future<void> load(String id) async {
    final postsService = ref.read(postsServiceProvider);

    state = await postsService.getPost(postId: id);
  }
}
