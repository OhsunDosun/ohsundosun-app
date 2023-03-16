import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
class SignInData with _$SignInData {
  const factory SignInData({
    required String accessToken,
    required String refreshToken,
  }) = _SignInData;

  factory SignInData.fromJson(Map<String, dynamic> json) => _$SignInDataFromJson(json);
}
