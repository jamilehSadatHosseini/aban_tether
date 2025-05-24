import 'package:aban_tether_app/domain/usecases/get_token_use_case.dart';
import 'package:aban_tether_app/presentation/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../../core/service/token_memory.dart';

class AuthGuard extends GetMiddleware {
  final GetTokenUseCase getTokenUseCase;

  AuthGuard(this.getTokenUseCase);

  @override
  RouteSettings? redirect(String? route) {
    final token = TokenMemory.get();
    return (token == null || token.isEmpty)
        ? const RouteSettings(name: Routes.login)
        : null;
  }
}
