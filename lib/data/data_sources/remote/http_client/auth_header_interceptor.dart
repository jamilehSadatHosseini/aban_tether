import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../local/token_local_data_source.dart';

@injectable
class AuthHeaderInterceptor extends Interceptor {
  final TokenLocalDataSource tokenLocalDataSource;

  AuthHeaderInterceptor(this.tokenLocalDataSource);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenLocalDataSource.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'FlutterApp/1.0.0',
    });

    return super.onRequest(options, handler);
  }
}
