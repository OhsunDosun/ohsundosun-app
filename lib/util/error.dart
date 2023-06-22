import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ohsundosun/model/response/common/default_response.dart';

String getErrorMessage(DioError e) {
  debugPrint(e.toString());
  final errorResponseData = e.response?.data;

  if (errorResponseData != null) {
    try {
      final response = DefaultResponse.fromJson(errorResponseData);
      return response.message;
    } catch (e) {
      debugPrint(e.toString());
      return "error";
    }
  } else {
    debugPrint(e.toString());
    return "error";
  }
}
