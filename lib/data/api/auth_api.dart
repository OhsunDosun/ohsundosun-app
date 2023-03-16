import 'dart:async';
import 'package:ohsundosun/model/request/auth/sign_in_request.dart';
import 'package:ohsundosun/model/response/auth/sign_in_response.dart';
import 'package:ohsundosun/model/response/auth/sign_new_response.dart';
import 'package:ohsundosun/model/response/common/data_response.dart';
import 'package:ohsundosun/model/response/common/default_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/v1/auth/sign")
  Future<DataResponse<SignInData>> signIn(
    @Body() SignInRequest body,
  );

  @GET("/v1/auth/sign")
  Future<DefaultResponse> signCheck();

  @POST("/v1/auth/password/new")
  Future<DataResponse> newPassword();

  @GET("/v1/auth/verify/email/:email")
  Future<DataResponse> verifyEmail();
}
