import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coins'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.coins.length,
              itemBuilder: (context, index) {
                final coin = state.coins[index];
                final isFavorite = state.favorites.contains(coin.id);

                return ListTile(
                  leading: Image.network(coin.iconUrl, width: 30),
                  title: Text(coin.name),
                  subtitle: Text(coin.symbol),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$${coin.price.toStringAsFixed(2)}'),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                          color: isFavorite ? Colors.amber : null,
                        ),
                        onPressed: () {
                          context.read<HomeBloc>().add(
                            ToggleFavorite(coin.id),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.failure.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
