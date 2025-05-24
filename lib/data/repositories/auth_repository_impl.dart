import 'package:aban_tether_app/core/error/failures.dart';
import 'package:aban_tether_app/data/data_sources/local/token_local_data_source.dart';
import 'package:aban_tether_app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:aban_tether_app/domain/entities/login_info.dart';
import 'package:aban_tether_app/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenLocalDataSource tokenLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      this.remoteDataSource, this.tokenLocalDataSource, this.networkInfo);

  @override
  Future<Either<Failure, String>> login(LoginInfo loginInfo) async {
    if (!kIsWeb &&!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final response = await remoteDataSource.login(loginInfo);
      await tokenLocalDataSource.saveToken(response.authToken);
      return Right(response.authToken);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return const Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await tokenLocalDataSource.getToken();
      return Right(token);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return const Left(ExceptionFailure());
    }
  }
  @override
  Future<Either<Failure, User>> getUserProfile() async {
    if (!kIsWeb && !await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final user = await remoteDataSource.getUserProfile();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ExceptionFailure());
    }
  }



  @override
  Future<Either<Failure, User>> updatePhoneNumber(int userId,String phoneNumber) async {
    if (!kIsWeb && !await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final response = await remoteDataSource.updatePhoneNumber( userId, phoneNumber);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ExceptionFailure());
    }
  }
}
