import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_new_response.freezed.dart';
part 'sign_new_response.g.dart';

@freezed
class SignNewData with _$SignNewData {
  const factory SignNewData({
    required String accessToken,
  }) = _SignNewData;

  factory SignNewData.fromJson(Map<String, dynamic> json) => _$SignNewDataFromJson(json);
}
