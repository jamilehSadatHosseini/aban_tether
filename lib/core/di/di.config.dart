// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../data/data_sources/local/token_local_data_source.dart' as _i864;
import '../../data/data_sources/remote/auth_remote_data_source.dart' as _i865;
import '../../data/data_sources/remote/coin_remote_data_source.dart' as _i240;
import '../../data/data_sources/remote/http_client/auth_header_interceptor.dart'
    as _i722;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/coin_repository_impl.dart' as _i743;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/repositories/coin_repository.dart' as _i167;
import '../../domain/usecases/get_coins_usecase.dart' as _i249;
import '../../domain/usecases/get_token_use_case.dart' as _i3;
import '../../domain/usecases/get_user_profile_usecase.dart' as _i629;
import '../../domain/usecases/login_usecase.dart' as _i253;
import '../../domain/usecases/update_phone_number_use_case.dart' as _i658;
import '../../presentation/home/home_bloc.dart' as _i632;
import '../../presentation/login/login_cubit.dart' as _i65;
import '../../presentation/profile/profile_bloc.dart' as _i797;
import '../network/network_info.dart' as _i932;
import 'di_module.dart' as _i211;
import 'internet_connection_module.dart' as _i272;
import 'storage_module.dart' as _i371;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final internetConnectionModule = _$InternetConnectionModule();
  final storageModule = _$StorageModule();
  final dioModule = _$DioModule();
  gh.lazySingleton<_i973.InternetConnectionChecker>(
    () => internetConnectionModule.connectionChecker,
  );
  gh.lazySingleton<_i558.FlutterSecureStorage>(() => storageModule.storage);
  gh.lazySingleton<_i932.NetworkInfo>(
    () => _i932.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
  );
  gh.lazySingleton<_i864.TokenLocalDataSource>(
    () => _i864.TokenLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
  );
  gh.factory<_i722.AuthHeaderInterceptor>(
    () => _i722.AuthHeaderInterceptor(gh<_i864.TokenLocalDataSource>()),
  );
  gh.lazySingleton<_i361.Dio>(
    () => dioModule.createAuthSecureClient(gh<_i722.AuthHeaderInterceptor>()),
    instanceName: 'authHttpClient',
  );
  gh.lazySingleton<_i865.AuthRemoteDataSource>(
    () => _i865.AuthRemoteDataSourceImp(
      gh<_i361.Dio>(instanceName: 'authHttpClient'),
    ),
  );
  gh.lazySingleton<_i1073.AuthRepository>(
    () => _i895.AuthRepositoryImpl(
      gh<_i865.AuthRemoteDataSource>(),
      gh<_i864.TokenLocalDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i361.Dio>(
    () => dioModule.createCoinClient(gh<_i722.AuthHeaderInterceptor>()),
    instanceName: 'httpClient',
  );
  gh.lazySingleton<_i3.GetTokenUseCase>(
    () => _i3.GetTokenUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.lazySingleton<_i629.GetUserProfileUseCase>(
    () => _i629.GetUserProfileUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.lazySingleton<_i253.LoginUseCase>(
    () => _i253.LoginUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.lazySingleton<_i658.UpdatePhoneNumberUseCase>(
    () => _i658.UpdatePhoneNumberUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i65.LoginCubit>(() => _i65.LoginCubit(gh<_i253.LoginUseCase>()));
  gh.factory<_i797.ProfileBloc>(
    () => _i797.ProfileBloc(
      getProfileUseCase: gh<_i629.GetUserProfileUseCase>(),
      updatePhoneUseCase: gh<_i658.UpdatePhoneNumberUseCase>(),
    ),
  );
  gh.lazySingleton<_i240.CoinRemoteDataSource>(
    () => _i240.CoinRemoteDataSourceImp(
      gh<_i361.Dio>(instanceName: 'httpClient'),
    ),
  );
  gh.lazySingleton<_i167.CoinRepository>(
    () => _i743.CoinRepositoryImpl(
      gh<_i240.CoinRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i249.GetCoinsUseCase>(
    () => _i249.GetCoinsUseCase(gh<_i167.CoinRepository>()),
  );
  gh.factory<_i632.HomeBloc>(() => _i632.HomeBloc(gh<_i249.GetCoinsUseCase>()));
  return getIt;
}

class _$InternetConnectionModule extends _i272.InternetConnectionModule {}

class _$StorageModule extends _i371.StorageModule {}

class _$DioModule extends _i211.DioModule {}
