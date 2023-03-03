import 'dart:async';
import 'package:ohsundosun/data/model/response/common/base_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/v1/auth/sign")
  Future<BaseResponse> signIn();

  @POST("/v1/auth/sign/new")
  Future<BaseResponse> newSign();

  @POST("/v1/auth/password/new")
  Future<BaseResponse> newPassword();

  @GET("/v1/auth/verify/email/:email")
  Future<BaseResponse> verifyEmail();
}
