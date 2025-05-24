import 'package:aban_tether_app/core/error/failures.dart';
import 'package:aban_tether_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';

@lazySingleton
class GetUserProfileUseCase implements UseCase<User, NoParams> {
  final AuthRepository repository;

  GetUserProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.getUserProfile();
  }
}
