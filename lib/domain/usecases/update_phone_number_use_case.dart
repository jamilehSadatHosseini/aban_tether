import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class UpdatePhoneNumberUseCase implements UseCase< User, User> {
  final AuthRepository repository;

  UpdatePhoneNumberUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(User user) {
    return repository.updatePhoneNumber(user.id,user.phoneNumber!);
  }
}