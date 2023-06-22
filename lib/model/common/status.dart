import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class AppStatus with _$AppStatus {
  const factory AppStatus({
    required String latestVersion,
    required String forceVersion,
  }) = _AppStatus;

  factory AppStatus.fromJson(Map<String, dynamic> json) => _$AppStatusFromJson(json);
}

@freezed
class ServerStatus with _$ServerStatus {
  const factory ServerStatus({
    required bool open,
  }) = _ServerStatus;

  factory ServerStatus.fromJson(Map<String, dynamic> json) => _$ServerStatusFromJson(json);
}
