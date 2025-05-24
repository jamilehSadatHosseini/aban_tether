import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/usecases/get_coins_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCoinsUseCase getCoinsUseCase;

  HomeBloc(this.getCoinsUseCase) : super(HomeInitial()) {
    on<LoadCoins>(_onLoadCoins);
  }

  Future<void> _onLoadCoins(LoadCoins event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final result = await getCoinsUseCase(NoParams());

    result.fold(
          (failure) => emit(HomeError(failure: failure)),
          (coins) => emit(HomeLoaded(coins: coins)),
    );
  }

}
