import 'dart:async';
import 'package:ohsundosun/model/common/comment.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/model/request/posts/add_comment_request.dart';
import 'package:ohsundosun/model/request/posts/add_post_request.dart';
import 'package:ohsundosun/model/request/posts/like_post_request.dart';
import 'package:ohsundosun/model/request/posts/update_post_request.dart';
import 'package:ohsundosun/model/response/common/data_response.dart';
import 'package:ohsundosun/model/response/common/paging_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'posts_api.g.dart';

@RestApi()
abstract class PostsApi {
  factory PostsApi(Dio dio, {String baseUrl}) = _PostsApi;

  @GET("/v1/posts")
  Future<DataResponse<PagingData<Post>>> getPosts({
    @Query("sort") required String sort,
    @Query("keyword") required String keyword,
    @Query("limit") required String limit,
    @Query("lastKey") required String lastKey,
    @Query("mbti") required String mbti,
    @Query("type") required String type,
  });

  @GET("/v1/posts/{postId}")
  Future<DataResponse<Post>> getPost({
    @Path('postId') required String postId,
  });

  @POST("/v1/posts")
  Future<DataResponse> addPost({
    @Body() required AddPostRequest body,
  });

  @PUT("/v1/posts/{postId}")
  Future<DataResponse> updatePost({
    @Path('postId') required String postId,
    @Body() required UpdatePostRequest body,
  });

  @DELETE("/v1/posts/{postId}")
  Future<DataResponse> deletePost({
    @Path('postId') required String postId,
  });

  @PATCH("/v1/posts/{postId}/like")
  Future<DataResponse> likePost({
    @Path('postId') required String postId,
    @Body() required LikePostRequest body,
  });

  @POST("/v1/posts/{postId}/report")
  Future<DataResponse> reportPost({
    @Path('postId') required String postId,
  });

  @GET("/v1/posts/{postId}/comments")
  Future<DataResponse<PagingData<Comment>>> getComments({
    @Path('postId') required String postId,
    @Query("limit") required String limit,
    @Query("lastKey") required String lastKey,
  });

  @POST("/v1/posts/{postId}/comments")
  Future<DataResponse> addComment({
    @Path('postId') required String postId,
    @Body() required AddCommentRequest body,
  });

  @DELETE("/v1/posts/{postId}/comments/{commnetId}")
  Future<DataResponse> deleteComment({
    @Path('postId') required String postId,
    @Path('commnetId') required String commnetId,
  });

  @POST("/v1/posts/{postId}/comments/{commnetId}/report")
  Future<DataResponse> reportComment({
    @Path('postId') required String postId,
    @Path('commnetId') required String commnetId,
  });
}
