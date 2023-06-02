import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_rating_request.freezed.dart';
part 'add_rating_request.g.dart';

@freezed
class AddRatingRequest with _$AddRatingRequest {
  const factory AddRatingRequest({
    required String feedback,
    required double rating,
  }) = _AddRatingRequest;

  factory AddRatingRequest.fromJson(Map<String, dynamic> json) => _$AddRatingRequestFromJson(json);
}
