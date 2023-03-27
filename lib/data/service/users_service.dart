import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/users_api.dart';
import 'package:ohsundosun/model/response/common/default_response.dart';
import 'package:ohsundosun/model/response/users/get_user_info_response.dart';

class UsersService {
  final UsersApi _usersApi;

  UsersService(this._usersApi);

  Future<GetUserInfoData> getUserInfo() async {
    try {
      final response = await _usersApi.getUserInfo();

      return response.data;
    } on DioError catch (e) {
      final errorResponse = e.response;

      if (errorResponse != null) {
        try {
          final response = DefaultResponse.fromJson(errorResponse.data);
          return Future.error(response.message);
        } catch (e) {
          return Future.error("error");
        }
      } else {
        return Future.error("error");
      }
    } catch (e) {
      return Future.error("error");
    }
  }
}
