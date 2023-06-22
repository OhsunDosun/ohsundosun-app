import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  final String message;
  final T data;

  const DataResponse({
    required this.message,
    required this.data,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$DataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return _$DataResponseToJson<T>(this, toJsonT);
  }
}
