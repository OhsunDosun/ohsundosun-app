import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/enum/mbti.dart';

part 'get_user_info_response.freezed.dart';
part 'get_user_info_response.g.dart';

@freezed
class GetUserInfoData with _$GetUserInfoData {
  const factory GetUserInfoData({
    required String nickname,
    required MBTI mbti,
    required bool notification,
  }) = _GetUserInfoData;

  factory GetUserInfoData.fromJson(Map<String, dynamic> json) => _$GetUserInfoDataFromJson(json);
}
