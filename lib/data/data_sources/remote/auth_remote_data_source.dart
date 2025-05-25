import 'package:aban_tether_app/core/constant/strings.dart';
import 'package:aban_tether_app/data/models/user_model.dart';
import 'package:aban_tether_app/domain/entities/login_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/login_response_model.dart';
import 'http_client/http_validation_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginInfo loginInfo);

  Future<UserModel> getUserProfile();

  Future<UserModel> updatePhoneNumber(int userId, String phoneNumber);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp
    with HttpResponseValidate
    implements AuthRemoteDataSource {
  final Dio authHttpClient;

  AuthRemoteDataSourceImp(@Named(authHttpClientNamed) this.authHttpClient);

  @override
  Future<LoginResponseModel> login(LoginInfo loginInfo) async {
      final response = await authHttpClient.post(
        '/auth/login',
        data: {'email': loginInfo.email, 'password': loginInfo.password},
      );
      validate(response);
      return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<UserModel> getUserProfile() async {
    final response = await authHttpClient.get('/auth/me');
    validate(response);
    return UserModel.fromJson(response.data);
  }

  @override
  Future<UserModel> updatePhoneNumber(int userId, String phoneNumber) async {
    final response = await authHttpClient.put(
      '/user/$userId',
      data: {'phone_number': phoneNumber},
    );
    validate(response);
    return UserModel.fromJson(response.data);
  }
}
