import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/users_api.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/request/users/add_rating_request.dart';
import 'package:ohsundosun/model/request/users/sign_up_request.dart';
import 'package:ohsundosun/model/request/users/update_mbti_request.dart';
import 'package:ohsundosun/model/request/users/update_nickname_request.dart';
import 'package:ohsundosun/model/request/users/update_notification_request.dart';
import 'package:ohsundosun/model/request/users/update_password_request.dart';
import 'package:ohsundosun/model/response/users/get_user_info_response.dart';
import 'package:ohsundosun/util/error.dart';

class UsersService {
  final UsersApi _usersApi;

  UsersService(this._usersApi);

  Future<GetUserInfoData> getUserInfo() async {
    try {
      final response = await _usersApi.getUserInfo();

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> updateNickname({required String nickname}) async {
    try {
      final response = await _usersApi.updateNickname(UpdateNicknameRequest(nickname: nickname));

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> updateNotification({required bool notification}) async {
    try {
      final response = await _usersApi.updateNotification(
        UpdateNotificationRequest(
          notification: notification,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> updateMBTI({
    required MBTI mbti,
  }) async {
    try {
      await _usersApi.updateMBTI(
        UpdateMBTIRequest(
          mbti: mbti.toString(),
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> signUp({
    required String email,
    required MBTI mbti,
    required String nickname,
    required String password,
  }) async {
    try {
      await _usersApi.signUp(
        SignUpRequest(
          email: email,
          mbti: mbti.toString(),
          nickname: nickname,
          password: password,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> addRating({
    required String feedback,
    required double rating,
  }) async {
    try {
      await _usersApi.addRating(
        AddRatingRequest(
          feedback: feedback,
          rating: rating,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> updatePassword({
    required SignInType type,
    required String newpassword,
    required String oldpassword,
  }) async {
    try {
      await _usersApi.updatePassword(
        UpdatePasswordRequest(
          type: type.toString(),
          newPassword: newpassword,
          oldPassword: oldpassword,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<void> blockUser({
    required String userId,
  }) async {
    try {
      await _usersApi.blockUser(
        userId: userId,
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }
}
