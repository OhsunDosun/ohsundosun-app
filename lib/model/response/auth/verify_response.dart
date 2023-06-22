import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_response.freezed.dart';
part 'verify_response.g.dart';

@freezed
class VerifyData with _$VerifyData {
  const factory VerifyData({
    required bool available,
  }) = _VerifyData;

  factory VerifyData.fromJson(Map<String, dynamic> json) => _$VerifyDataFromJson(json);
}
