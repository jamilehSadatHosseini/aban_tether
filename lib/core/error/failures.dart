import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure({required String message}) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("Please check your internet connection.");
}

class ExceptionFailure extends Failure {
  const ExceptionFailure() : super("An unknown error has occurred.");
}

class CredentialFailure extends Failure {
  const CredentialFailure() : super("Email or password is incorrect.");
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure()
      : super("Authentication not completed. Please log in.");
}
