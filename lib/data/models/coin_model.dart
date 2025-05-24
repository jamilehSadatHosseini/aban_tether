import '../../domain/entities/coin.dart';

class CoinModel extends Coin {
  CoinModel({
    required int id,
    required String name,
    required double price,
    required String symbol,
    required String iconUrl,
    required bool isFavorite,
  }) : super(
    id: id,
    name: name,
    price: price,
    symbol: symbol,
    iconUrl: iconUrl,
    isFavorite: isFavorite,
  );

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      symbol: json['symbol'],
      iconUrl: json['icon_address'],
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'symbol': symbol,
      'icon_address': iconUrl,
      'is_favorite': isFavorite,
    };
  }
}
