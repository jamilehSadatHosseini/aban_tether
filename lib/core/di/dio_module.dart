import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constant/strings.dart';
import '../network/auth_header_interceptor.dart';

@module
abstract class DioModule {
  @LazySingleton()
  @Named("authHttpClient")
  Dio createAuthSecureClient(AuthHeaderInterceptor interceptor) {
    final dio = Dio(BaseOptions(baseUrl:baseUrlAuthentication));
    dio.interceptors.add(interceptor);
    return dio;
  }

  @LazySingleton()
  @Named("HttpClient")
  Dio createCoinClient(AuthHeaderInterceptor interceptor) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(interceptor);
    return dio;
  }
}
