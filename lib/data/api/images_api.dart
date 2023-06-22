import 'dart:async';
import 'dart:io';
import 'package:ohsundosun/model/response/common/data_response.dart';
import 'package:ohsundosun/model/response/images/add_images_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'images_api.g.dart';

@RestApi()
abstract class ImagesApi {
  factory ImagesApi(Dio dio, {String baseUrl}) = _ImagesApi;

  @POST("/v1/images")
  @MultiPart()
  Future<DataResponse<AddImagesData>> addImage({
    @Part() required String category,
    @Part() required List<File> images,
  });
}
