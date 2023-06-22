import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_notification_request.freezed.dart';
part 'update_notification_request.g.dart';

@freezed
class UpdateNotificationRequest with _$UpdateNotificationRequest {
  const factory UpdateNotificationRequest({
    required bool notification,
  }) = _UpdateNotificationRequest;

  factory UpdateNotificationRequest.fromJson(Map<String, dynamic> json) => _$UpdateNotificationRequestFromJson(json);
}
