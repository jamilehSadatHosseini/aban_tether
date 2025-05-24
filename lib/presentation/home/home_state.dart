import 'package:aban_tether_app/core/error/failures.dart';

import '../../../domain/entities/coin.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Coin> coins;
  final List<String> favorites;

  HomeLoaded({required this.coins, required this.favorites});
}

class HomeError extends HomeState {
  final Failure failure;

  HomeError({required this.failure});
}
