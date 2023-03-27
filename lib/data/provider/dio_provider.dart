import 'package:dio/dio.dart';
import 'package:ohsundosun/model/request/auth/sign_in_request.dart';
import 'package:ohsundosun/model/response/auth/sign_in_response.dart';
import 'package:ohsundosun/model/response/auth/sign_new_response.dart';
import 'package:ohsundosun/model/response/common/data_response.dart';
import 'package:ohsundosun/model/response/common/default_response.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio
    ..options.headers["App-Key"] = ref.watch(appKeyProvider)
    ..options.headers["Cookie"] = "access-token=${ref.watch(accessTokenProvider)};"
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      final data = e.response?.data;
      if (e.requestOptions.baseUrl == ref.read(baseUrlProvider) && data != null && data.runtimeType != String) {
        final responseData = DefaultResponse.fromJson(data);

        final error = e;

        switch (responseData.message) {
          case "unauthorized_access_token":
            try {
              final signNewResult = await dio.post(
                "${ref.read(baseUrlProvider)}/v1/auth/sign/new",
                options: Options(
                  headers: {
                    "Cookie": "refresh-token=${ref.read(refreshTokenProvider)};",
                  },
                ),
              );

              final signNewResponse =
                  DataResponse<SignNewData>.fromJson(signNewResult.data, (json) => SignNewData.fromJson(json as Map<String, dynamic>));
              await ref.read(accessTokenProvider.notifier).update(signNewResponse.data.accessToken);

              final reRequest = await dio.request(
                error.requestOptions.baseUrl + error.requestOptions.path,
                options: Options(
                  method: error.requestOptions.method,
                  headers: {
                    "Cookie": "access-token=${ref.read(accessTokenProvider)};",
                  },
                ),
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters,
              );

              return handler.resolve(reRequest);
            } on DioError catch (e) {
              final signNewData = e.response?.data;
              if (signNewData != null) {
                final signNewResponseData = DefaultResponse.fromJson(signNewData);

                if (signNewResponseData.message == "unauthorized_refresh_token") {
                  try {
                    final signInResult = await dio.post(
                      "${ref.read(baseUrlProvider)}/v1/auth/sign",
                      options: Options(
                        headers: {
                          "Content-Type": "application/json",
                        },
                      ),
                      data: SignInRequest(
                        type: ref.read(appSignInTypeProvider) ?? SignInType.defaultSignIn,
                        email: ref.read(appEmailProvider) ?? "",
                        password: ref.read(appPasswordProvider) ?? "",
                      ),
                    );

                    final signInResponse =
                        DataResponse<SignInData>.fromJson(signInResult.data, (json) => SignInData.fromJson(json as Map<String, dynamic>));

                    await ref.read(accessTokenProvider.notifier).update(signInResponse.data.accessToken);
                    await ref.read(refreshTokenProvider.notifier).update(signInResponse.data.refreshToken);

                    final reRequest = await dio.request(
                      error.requestOptions.baseUrl + error.requestOptions.path,
                      options: Options(
                        method: error.requestOptions.method,
                        headers: {
                          "Cookie": "access-token=${ref.read(accessTokenProvider)};",
                        },
                      ),
                      data: error.requestOptions.data,
                      queryParameters: error.requestOptions.queryParameters,
                    );

                    return handler.resolve(reRequest);
                  } on DioError catch (_) {
                    await ref.read(appSignInTypeProvider.notifier).update(null);
                    await ref.read(appEmailProvider.notifier).update(null);
                    await ref.read(appPasswordProvider.notifier).update(null);

                    await ref.read(accessTokenProvider.notifier).update(null);
                    await ref.read(refreshTokenProvider.notifier).update(null);

                    ref.read(routerProvider).go(AppRoute.onboard);
                  }
                }
              }
              break;
            }
          default:
            break;
        }
      }

      return handler.next(e);
    }))
    ..interceptors.add(dioLogger);

  return dio;
}
