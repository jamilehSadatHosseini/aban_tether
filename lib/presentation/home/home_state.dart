import 'package:aban_tether_app/core/error/failures.dart';
import '../../../domain/entities/coin.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Coin> coins;
  HomeLoaded({required this.coins});
}

class HomeError extends HomeState {
  final Failure failure;

  HomeError({required this.failure});
}
