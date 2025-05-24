abstract class HomeEvent {}

class LoadCoins extends HomeEvent {}

class ToggleFavorite extends HomeEvent {
  final int coinId;

  ToggleFavorite(this.coinId);
}
