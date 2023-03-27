import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/posts_api.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_sort.dart';
import 'package:ohsundosun/enum/post_type.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/util/error.dart';

class PostsService {
  final PostsApi _postsApi;

  PostsService(this._postsApi);

  Future<List<Post>> getPosts({
    required PostSort sort,
    String? keyword,
    int? limit,
    String? lastKey,
    MBTI? mbti,
    PostType? type,
  }) async {
    try {
      final response = await _postsApi.getPosts(
        sort: sort.toValue(),
        keyword: keyword ?? "",
        limit: limit?.toString() ?? "",
        lastKey: lastKey ?? "",
        mbti: mbti?.toString() ?? "",
        type: type?.toValue() ?? "",
      );

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }
}
