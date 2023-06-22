import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagingData<T> {
  final int? lastKey;
  final List<T> list;

  const PagingData({
    this.lastKey,
    required this.list,
  });

  factory PagingData.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$PagingDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return _$PagingDataToJson<T>(this, toJsonT);
  }
}
