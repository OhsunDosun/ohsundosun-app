import 'dart:async';
import 'package:ohsundosun/model/response/common/data_response.dart';
import 'package:ohsundosun/model/response/users/get_user_info_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'users_api.g.dart';

@RestApi()
abstract class UsersApi {
  factory UsersApi(Dio dio, {String baseUrl}) = _UsersApi;

  @GET("/v1/users")
  Future<DataResponse<GetUserInfoData>> getUserInfo();
}
