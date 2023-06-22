import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_post_request.freezed.dart';
part 'add_post_request.g.dart';

@freezed
class AddPostRequest with _$AddPostRequest {
  const factory AddPostRequest({
    required String type,
    required String mbti,
    required String title,
    required String content,
    required List<String> images,
  }) = _AddPostRequest;

  factory AddPostRequest.fromJson(Map<String, dynamic> json) => _$AddPostRequestFromJson(json);
}
