import 'package:aban_tether_app/core/constant/strings.dart';
import 'package:aban_tether_app/data/models/coin_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'http_client/http_validation_response.dart';

abstract class CoinRemoteDataSource {
  Future<List<CoinModel>> getCoinsList();
}

@LazySingleton(as: CoinRemoteDataSource)
class CoinRemoteDataSourceImp
    with HttpResponseValidate
    implements CoinRemoteDataSource {
  final Dio httpClient;

  CoinRemoteDataSourceImp(@Named(httpClientNamed) this.httpClient);

  @override
  Future<List<CoinModel>> getCoinsList() async {
    final response = await httpClient.get('/cryptocurrency');
    validate(response);
    final List<dynamic> data = response.data;
    return data.map((json) => CoinModel.fromJson(json)).toList();
  }
}
