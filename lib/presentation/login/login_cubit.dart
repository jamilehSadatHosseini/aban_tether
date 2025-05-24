import 'package:aban_tether_app/domain/entities/login_info.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/login_usecase.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await loginUseCase(LoginInfo(email: email, password: password));
    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (_) => emit(LoginSuccess()),
    );
  }
}

