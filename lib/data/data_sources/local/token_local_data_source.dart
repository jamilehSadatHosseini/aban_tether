import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constant/strings.dart';

abstract class TokenLocalDataSource {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearToken();
}

@LazySingleton(as:TokenLocalDataSource)
class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  TokenLocalDataSourceImpl(this.flutterSecureStorage);

  @override
  Future<void> clearToken() async {
    await flutterSecureStorage.delete(key: authToken);
  }

  @override
  Future<String?> getToken() async {
    return await flutterSecureStorage.read(key: authToken);
  }

  @override
  Future<void> saveToken(String token) async {
    await flutterSecureStorage.write(key: authToken, value: token);
  }
}
