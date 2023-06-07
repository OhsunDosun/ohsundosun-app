import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_mbti_request.freezed.dart';
part 'update_mbti_request.g.dart';

@freezed
class UpdateMBTIRequest with _$UpdateMBTIRequest {
  const factory UpdateMBTIRequest({
    required String mbti,
  }) = _UpdateMBTIRequest;

  factory UpdateMBTIRequest.fromJson(Map<String, dynamic> json) => _$UpdateMBTIRequestFromJson(json);
}
