import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_comment_request.freezed.dart';
part 'add_comment_request.g.dart';

@freezed
class AddCommentRequest with _$AddCommentRequest {
  const factory AddCommentRequest({
    required String content,
  }) = _AddCommentRequest;

  factory AddCommentRequest.fromJson(Map<String, dynamic> json) => _$AddCommentRequestFromJson(json);
}
