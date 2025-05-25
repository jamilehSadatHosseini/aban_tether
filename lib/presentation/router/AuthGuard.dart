import 'package:aban_tether_app/domain/usecases/get_token_use_case.dart';
import 'package:aban_tether_app/presentation/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import '../../core/usecases/usecase.dart';

  class AuthGuard extends GetMiddleware {
  final GetTokenUseCase getTokenUseCase;

  AuthGuard(this.getTokenUseCase);

  @override
  Future<RouteSettings?> redirectFuture(String? route) async {
  final result = await getTokenUseCase(NoParams());

  return result.fold(
  (failure) => const RouteSettings(name: Routes.login),
  (token) {
  if (token == null || token.isEmpty) {
  return const RouteSettings(name: Routes.login);
  }
  return null;
  },
  );
  }
  }
