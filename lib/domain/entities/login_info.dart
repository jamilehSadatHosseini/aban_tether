import 'package:equatable/equatable.dart';

class LoginInfo extends Equatable {
  final String email;
  final String password;

  const LoginInfo({
    required this.email,required this.password
  });

  @override
  List<Object?> get props => [email,password];
}
