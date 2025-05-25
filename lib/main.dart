import 'package:aban_tether_app/core/constant/strings.dart';
import 'package:aban_tether_app/presentation/home/home_bloc.dart';
import 'package:aban_tether_app/presentation/home/home_event.dart';
import 'package:aban_tether_app/presentation/login/login_cubit.dart';
import 'package:aban_tether_app/presentation/profile/profile_bloc.dart';
import 'package:aban_tether_app/presentation/home/home_screen.dart';
import 'package:aban_tether_app/presentation/login/login_screen.dart';
import 'package:aban_tether_app/presentation/profile/profile_screen.dart';
import 'package:aban_tether_app/presentation/router/AuthGuard.dart';
import 'package:aban_tether_app/presentation/router/routes.dart';
import 'package:aban_tether_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/di/di.dart';
import 'core/service/token_memory.dart';
import 'core/usecases/usecase.dart';
import 'domain/usecases/get_token_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final getTokenUseCase = getIt<GetTokenUseCase>();
  final result = await getTokenUseCase(NoParams());
  result.fold(
    (failure) => TokenMemory.set(null),
    (token) => TokenMemory.set(token),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeDataConfig.light().getThemeData(),
      darkTheme: ThemeDataConfig.dark().getThemeData(),
      themeMode: ThemeMode.system,
      initialRoute: Routes.login,
      getPages: [
        GetPage(
          name: Routes.login,
          page: () => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        ),
        GetPage(
          name: Routes.home,
          page: () => BlocProvider(
            create: (_) => getIt<HomeBloc>()..add(LoadCoins()),
            child: HomeScreen(),
          ),
          middlewares: [AuthGuard(getIt<GetTokenUseCase>())],
        ),
        GetPage(
          name: Routes.profile,
          page: () => BlocProvider(
            create: (_) => getIt<ProfileBloc>()..add(LoadProfileEvent()),

            child: ProfileScreen(),
          ),
          middlewares: [AuthGuard(getIt<GetTokenUseCase>())],
        ),
      ],
    );
  }
}
