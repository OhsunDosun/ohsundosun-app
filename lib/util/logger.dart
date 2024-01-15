import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

final dioLogger = InterceptorsWrapper(onRequest: (options, handler) {
  debugPrint('[${options.method}] ${options.path}');
  debugPrint('REQUEST');
  if (options.method == "GET") {
    debugPrint('${options.queryParameters}');
  } else {
    debugPrint('${options.data}');
  }
  debugPrint('${options.headers["cookie"]}');
  debugPrint('____________________________________________');
  return handler.next(options);
}, onResponse: (response, handler) {
  debugPrint('[${response.requestOptions.method}] ${response.requestOptions.path}');
  debugPrint('RESPONSE [${response.statusCode}]');
  debugPrint('${response.data}');
  debugPrint('____________________________________________');
  return handler.next(response);
}, onError: (DioException e, handler) {
  debugPrint('[${e.requestOptions.method}] ${e.requestOptions.path}');
  debugPrint('ERROR  [${e.response?.statusCode}]');
  debugPrint('${e.response?.data}');
  debugPrint('____________________________________________');
  return handler.next(e);
});
