import 'package:aban_tether_app/core/error/failures.dart';
import 'package:aban_tether_app/domain/entities/login_info.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(LoginInfo loginInfo);

  Future<Either<Failure, String?>> getToken();

  Future<Either<Failure, User>> getUserProfile();

  Future<Either<Failure, User>> updatePhoneNumber(
    int userId,
    String phoneNumber,
  );
}
