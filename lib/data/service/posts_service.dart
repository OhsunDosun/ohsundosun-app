import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/posts_api.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_sort.dart';
import 'package:ohsundosun/enum/post_type.dart';
import 'package:ohsundosun/model/common/comment.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/model/request/posts/add_comment_request.dart';
import 'package:ohsundosun/model/request/posts/add_post_request.dart';
import 'package:ohsundosun/model/request/posts/like_post_request.dart';
import 'package:ohsundosun/model/request/posts/update_post_request.dart';
import 'package:ohsundosun/model/response/common/paging_response.dart';
import 'package:ohsundosun/util/error.dart';

class PostsService {
  final PostsApi _postsApi;

  PostsService(this._postsApi);

  Future<PagingData<PostUI>> getPosts({
    required PostSort sort,
    String? keyword,
    int? limit,
    int? lastKey,
    MBTI? mbti,
    PostType? type,
  }) async {
    try {
      final response = await _postsApi.getPosts(
        sort: sort.toValue(),
        keyword: keyword ?? "",
        limit: limit?.toString() ?? "",
        lastKey: lastKey?.toString() ?? "",
        mbti: mbti?.toString() ?? "",
        type: type?.toValue() ?? "",
      );

      return PagingData(
        lastKey: response.data.lastKey,
        list: response.data.list.map((item) => item.toUI()).toList(),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<PostUI> getPost({
    required String postId,
  }) async {
    try {
      final response = await _postsApi.getPost(
        postId: postId,
      );

      return response.data.toUI();
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<PagingData<CommentUI>> getComments({
    required String postId,
    int? limit,
    int? lastKey,
  }) async {
    try {
      final response = await _postsApi.getComments(
        postId: postId,
        limit: limit?.toString() ?? "",
        lastKey: lastKey?.toString() ?? "",
      );

      return PagingData(
        lastKey: response.data.lastKey,
        list: response.data.list.map((item) => item.toUI()).toList(),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> addPost({
    required PostType type,
    required MBTI mbti,
    required String title,
    required String content,
    required List<String> images,
  }) async {
    try {
      await _postsApi.addPost(
        body: AddPostRequest(
          type: type.toValue(),
          mbti: mbti.toString(),
          title: title,
          content: content,
          images: images,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> updatePost({
    required String postId,
    required PostType type,
    required String title,
    required String content,
    required List<String> images,
  }) async {
    try {
      await _postsApi.updatePost(
        postId: postId,
        body: UpdatePostRequest(
          type: type.toValue(),
          title: title,
          content: content,
          images: images,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> deletePost({
    required String postId,
  }) async {
    try {
      await _postsApi.deletePost(
        postId: postId,
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> likePost({
    required String postId,
    required bool like,
  }) async {
    try {
      await _postsApi.likePost(
        postId: postId,
        body: LikePostRequest(
          like: like,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> reportPost({
    required String postId,
  }) async {
    try {
      await _postsApi.reportPost(
        postId: postId,
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> addComment({
    required String postId,
    required String content,
  }) async {
    try {
      await _postsApi.addComment(
        postId: postId,
        body: AddCommentRequest(
          content: content,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> addCommentReply({
    required String postId,
    required String commentId,
    required String content,
  }) async {
    try {
      await _postsApi.addComment(
        postId: postId,
        body: AddCommentRequest(
          commentId: commentId,
          content: content,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    try {
      await _postsApi.deleteComment(
        postId: postId,
        commnetId: commentId,
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> reportComment({
    required String postId,
    required String commentId,
  }) async {
    try {
      await _postsApi.reportComment(
        postId: postId,
        commnetId: commentId,
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }
}
