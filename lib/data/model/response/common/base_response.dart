import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final String message;
  final T data;

  const BaseResponse({
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return _$BaseResponseToJson<T>(this, toJsonT);
  }
}
