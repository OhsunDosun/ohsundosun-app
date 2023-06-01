import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/posts_api.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_sort.dart';
import 'package:ohsundosun/enum/post_type.dart';
import 'package:ohsundosun/model/common/comment.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/model/request/post/add_comment_request.dart';
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

  Future<Post> getPost({
    required String postId,
  }) async {
    try {
      final response = await _postsApi.getPost(
        postId: postId,
      );

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<List<Comment>> getComments({
    required String postId,
    int? limit,
    String? lastKey,
  }) async {
    try {
      final response = await _postsApi.getComments(
        postId: postId,
        limit: limit?.toString() ?? "",
        lastKey: lastKey ?? "",
      );

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> addPost({
    required PostType type,
    required String title,
    required String content,
    required List<File> images,
  }) async {
    try {
      await _postsApi.addPost(
        type: type.toValue(),
        title: title,
        content: content,
        images: images,
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
}
