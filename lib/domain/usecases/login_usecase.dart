import 'package:aban_tether_app/core/error/failures.dart';
import 'package:aban_tether_app/domain/entities/login_info.dart';
import 'package:aban_tether_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/usecases/usecase.dart';

@lazySingleton
class LoginUseCase implements UseCase<String, LoginInfo> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginInfo params) {
    return repository.login(params);
  }
}
