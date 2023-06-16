import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_post_request.freezed.dart';
part 'update_post_request.g.dart';

@freezed
class UpdatePostRequest with _$UpdatePostRequest {
  const factory UpdatePostRequest({
    required String type,
    required String title,
    required String content,
    required List<String> images,
  }) = _UpdatePostRequest;

  factory UpdatePostRequest.fromJson(Map<String, dynamic> json) => _$UpdatePostRequestFromJson(json);
}
