import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/auth_api.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/request/auth/sign_in_request.dart';
import 'package:ohsundosun/model/response/auth/verify_response.dart';
import 'package:ohsundosun/model/response/common/default_response.dart';
import 'package:ohsundosun/util/error.dart';

class AuthService {
  final AuthApi _authApi;

  AuthService(this._authApi);

  Future<void> signIn({
    SignInType type = SignInType.defaultSignIn,
    required String email,
    required String password,
    String? fcmToken,
  }) async {
    try {
      await _authApi.signIn(
        SignInRequest(
          type: type,
          email: email,
          password: password,
          fcm: fcmToken,
        ),
      );
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<DefaultResponse> signCheck() async {
    try {
      return await _authApi.signCheck();
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<VerifyData> verifyEmail({
    required String email,
  }) async {
    try {
      final response = await _authApi.verifyEmail(email: email);

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<VerifyData> verifyNickname({
    required String nickname,
  }) async {
    try {
      final response = await _authApi.verifyNickname(nickname: nickname);

      return response.data;
    } on DioError catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }
}
