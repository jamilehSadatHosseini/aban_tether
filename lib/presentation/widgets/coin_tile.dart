import 'package:flutter/material.dart';

import '../../domain/entities/coin.dart';

class CoinTile extends StatelessWidget {
  final Coin coin;
  final bool initialFavorite;
  final void Function(bool) onToggle;

  const CoinTile({
    super.key,
    required this.coin,
    required this.initialFavorite,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final favNotifier = ValueNotifier<bool>(initialFavorite);

    return ListTile(
      leading: Image.network(
      coin.iconUrl,
      width: 30,
      height: 30,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image, size: 30, color: Colors.grey);
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      },
    ),

      title: Text(coin.name),
      subtitle: Text(coin.symbol),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('\$${coin.price.toStringAsFixed(2)}'),
          ValueListenableBuilder<bool>(
            valueListenable: favNotifier,
            builder: (context, isFav, _) {
              return IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  color: isFav ? Colors.amber : null,
                ),
                onPressed: () {
                  final newVal = !isFav;
                  favNotifier.value = newVal;
                  onToggle(newVal); // به BLoC اطلاع می‌ده
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
