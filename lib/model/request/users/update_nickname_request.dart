import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_nickname_request.freezed.dart';
part 'update_nickname_request.g.dart';

@freezed
class UpdateNicknameRequest with _$UpdateNicknameRequest {
  const factory UpdateNicknameRequest({
    required String nickname,
  }) = _UpdateNicknameRequest;

  factory UpdateNicknameRequest.fromJson(Map<String, dynamic> json) => _$UpdateNicknameRequestFromJson(json);
}
