import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../router/routes.dart';
import '../widgets/coin_tile.dart';
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
              Get.toNamed(Routes.profile);
              ;
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
                final isFavorite = coin.isFavorite;

                return CoinTile(
                  coin: coin,
                  initialFavorite: isFavorite,
                  onToggle: (isFav) {
                    context.read<HomeBloc>().add(
                      ToggleFavorite(coin.id),
                    );
                  },
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
