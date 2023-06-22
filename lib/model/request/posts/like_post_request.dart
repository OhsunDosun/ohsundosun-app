import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_post_request.freezed.dart';
part 'like_post_request.g.dart';

@freezed
class LikePostRequest with _$LikePostRequest {
  const factory LikePostRequest({
    required bool like,
  }) = _LikePostRequest;

  factory LikePostRequest.fromJson(Map<String, dynamic> json) => _$LikePostRequestFromJson(json);
}
