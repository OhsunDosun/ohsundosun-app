import 'dart:async';
import 'dart:io';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/model/response/common/data_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'posts_api.g.dart';

@RestApi()
abstract class PostsApi {
  factory PostsApi(Dio dio, {String baseUrl}) = _PostsApi;

  @GET("/v1/posts")
  Future<DataResponse<List<Post>>> getPosts({
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
  @MultiPart()
  Future<DataResponse> addPost({
    @Part() required String type,
    @Part() required String title,
    @Part() required String content,
    @Part() required List<File> images,
  });
}
