import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/coin.dart';

abstract class CoinRepository {
  Future<Either<Failure,List<Coin>>> getCoins();
}