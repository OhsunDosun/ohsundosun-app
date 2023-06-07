import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_post_request.freezed.dart';
part 'upsert_post_request.g.dart';

@freezed
class UpsertPostRequest with _$UpsertPostRequest {
  const factory UpsertPostRequest({
    required String type,
    required String title,
    required String content,
    required List<String> images,
  }) = _UpsertPostRequest;

  factory UpsertPostRequest.fromJson(Map<String, dynamic> json) => _$UpsertPostRequestFromJson(json);
}
