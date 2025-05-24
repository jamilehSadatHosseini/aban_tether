import 'package:aban_tether_app/data/data_sources/local/token_local_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthHeaderInterceptor extends Interceptor {

  final TokenLocalDataSource localStorage;
  AuthHeaderInterceptor(this.localStorage);
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token= await localStorage.getToken();
   // final token= "eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiemlwIjoiREVGIn0.qFP9Ey3okCQ1sHnv7cYRc5ne6Ges8Zkwhjq7YwUnNz8121U54v9jL4VLSUwesekreJp_1cGqZs7NwwlgMjdw_Y9MhqdPpn8_.5OYoQGQVeGkVhpodFEgPTw.IAGkvIIooy7ljHUNbvKyC_rB5O1m8enCBaEZbcMi0k6kK4AAvDTroqgTopUHBwPTDhZ8j7HVMLdnksf92B2wzvVLZtSa50Y0GfxpK4M0GM8rEl3SSHUY6HhW6hJT8jkUqu1Awk37OIQGnGUZ1yT-7T-rlQZ4k9JlgRMCjYxliog.qEYG95QIEtIAqUmvVDO-TRxW3Dw7zkog6p24jdNHljI";
    if(token !=null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}