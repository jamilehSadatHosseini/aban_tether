import 'package:aban_tether_app/data/data_sources/remote/coin_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/coin.dart';
import '../../domain/repositories/coin_repository.dart';

@LazySingleton(as: CoinRepository)
class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CoinRepositoryImpl(this.remoteDataSource,this.networkInfo);

  @override
  Future<Either<Failure, List<Coin>>> getCoins() async {
    if (!kIsWeb && !await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final response = await remoteDataSource.getCoinsList();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      print(e.toString());
      return const Left(ExceptionFailure());
    }
  }

}
