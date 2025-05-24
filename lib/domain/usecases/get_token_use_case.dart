import 'package:aban_tether_app/core/error/failures.dart';
import 'package:aban_tether_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/usecases/usecase.dart';

@lazySingleton
class GetTokenUseCase implements UseCase<String?, NoParams> {
  final AuthRepository repository;

  GetTokenUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return repository.getToken();
  }
}
