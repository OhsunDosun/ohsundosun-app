import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';

part 'sign_in_request.freezed.dart';
part 'sign_in_request.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    required SignInType type,
    required String email,
    required String password,
    String? fcm,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);
}
