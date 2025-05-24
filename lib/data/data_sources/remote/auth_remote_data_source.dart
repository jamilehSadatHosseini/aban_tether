import 'dart:math';

import 'package:aban_tether_app/data/models/user_model.dart';
import 'package:aban_tether_app/domain/entities/login_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/login_response_model.dart';
import 'http_validation_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginInfo loginInfo);
  Future<UserModel> getUserProfile();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp
    with HttpResponseValidate
    implements AuthRemoteDataSource {

  final Dio httpClient;
  AuthRemoteDataSourceImp(@Named("authHttpClient") this.httpClient);

  @override
  Future<LoginResponseModel> login(LoginInfo loginInfo) async {
    try {
      final response = await httpClient.post('auth/login', data: {
        'email': loginInfo.email,
        'password': loginInfo.password,
      });
      validate(response);
      return LoginResponseModel.fromJson(response.data);
    } catch (e, stackTrace) {
      print('Error during login: $e');
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserProfile()async {
    final response = await httpClient.get('/auth/me');
    validate(response);
    return UserModel.fromJson(response.data);
  }
}