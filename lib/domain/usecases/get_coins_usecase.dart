import 'package:aban_tether_app/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/coin.dart';

@lazySingleton
class GetCoinsUseCase implements UseCase<List<Coin>, NoParams> {
  final CoinRepository repository;

  GetCoinsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Coin>>> call(NoParams params) {
    return repository.getCoins();
  }
}