import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/images_api.dart';
import 'package:ohsundosun/enum/image_category.dart';
import 'package:ohsundosun/util/error.dart';

class ImagesService {
  final ImagesApi _imagesApi;

  ImagesService(this._imagesApi);

  Future<List<String>> addImage({
    required ImageCategory category,
    required List<File> images,
  }) async {
    try {
      final response = await _imagesApi.addImage(
        category: category.toValue(),
        images: images,
      );

      return response.data.images;
    } on DioException catch (e) {
      return Future.error(getErrorMessage(e));
    } catch (e) {
      return Future.error("error");
    }
  }
}
