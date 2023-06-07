import 'dart:async';
import 'package:ohsundosun/model/request/users/add_rating_request.dart';
import 'package:ohsundosun/model/request/users/sign_up_request.dart';
import 'package:ohsundosun/model/request/users/update_mbti_request.dart';
import 'package:ohsundosun/model/request/users/update_nickname_request.dart';
import 'package:ohsundosun/model/request/users/update_notification_request.dart';
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

  @POST("/v1/users")
  Future<DataResponse> signUp(
    @Body() SignUpRequest body,
  );

  @PATCH("/v1/users/nickname")
  Future<DataResponse> updateNickname(
    @Body() UpdateNicknameRequest body,
  );

  @PATCH("/v1/users/mbti")
  Future<DataResponse> updateMBTI(
    @Body() UpdateMBTIRequest body,
  );

  @PATCH("/v1/users/notification")
  Future<DataResponse> updateNotification(
    @Body() UpdateNotificationRequest body,
  );

  @POST("/v1/users/rating")
  Future<DataResponse> addRating(
    @Body() AddRatingRequest body,
  );
}
