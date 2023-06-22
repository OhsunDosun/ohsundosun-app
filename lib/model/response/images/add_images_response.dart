import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_images_response.freezed.dart';
part 'add_images_response.g.dart';

@freezed
class AddImagesData with _$AddImagesData {
  const factory AddImagesData({
    required List<String> images,
  }) = _AddImagesData;

  factory AddImagesData.fromJson(Map<String, dynamic> json) => _$AddImagesDataFromJson(json);
}
