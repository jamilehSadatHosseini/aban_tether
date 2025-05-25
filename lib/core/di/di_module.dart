import 'package:aban_tether_app/data/data_sources/remote/http_client/auth_header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../constant/strings.dart';

@module
abstract class DioModule {
  @LazySingleton()
  @Named(authHttpClientNamed)
  Dio createAuthSecureClient(AuthHeaderInterceptor interceptor) {
    final dio = Dio(BaseOptions(baseUrl:baseUrlAuthentication));
    dio.interceptors.add(interceptor);
    dio.interceptors.add(
    LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    logPrint: (obj) {
    if (kDebugMode) {
      print("📦 $obj");
    }
    },
    ));
    return dio;
  }

  @LazySingleton()
  @Named(httpClientNamed)
  Dio createCoinClient(AuthHeaderInterceptor interceptor) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(interceptor);
    dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          logPrint: (obj) {
              if (kDebugMode) {
                print("📦 $obj");
              }
          },
        ));
    return dio;
  }
}
