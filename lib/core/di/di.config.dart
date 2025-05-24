// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aban_tether_app/core/di/dio_module.dart' as _i463;
import 'package:aban_tether_app/core/di/internet_connection_module.dart'
    as _i317;
import 'package:aban_tether_app/core/di/storage_module.dart' as _i188;
import 'package:aban_tether_app/core/network/auth_header_interceptor.dart'
    as _i485;
import 'package:aban_tether_app/core/network/network_info.dart' as _i328;
import 'package:aban_tether_app/data/data_sources/local/token_local_data_source.dart'
    as _i437;
import 'package:aban_tether_app/data/data_sources/remote/auth_remote_data_source.dart'
    as _i1041;
import 'package:aban_tether_app/data/data_sources/remote/coin_remote_data_source.dart'
    as _i636;
import 'package:aban_tether_app/data/repositories/auth_repository_impl.dart'
    as _i362;
import 'package:aban_tether_app/data/repositories/coin_repository_impl.dart'
    as _i693;
import 'package:aban_tether_app/domain/repositories/auth_repository.dart'
    as _i853;
import 'package:aban_tether_app/domain/repositories/coin_repository.dart'
    as _i756;
import 'package:aban_tether_app/domain/usecases/get_coins_usecase.dart'
    as _i501;
import 'package:aban_tether_app/domain/usecases/get_token_use_case.dart'
    as _i543;
import 'package:aban_tether_app/domain/usecases/get_user_profile_usecase.dart'
    as _i168;
import 'package:aban_tether_app/domain/usecases/login_usecase.dart' as _i86;
import 'package:aban_tether_app/domain/usecases/update_phone_number_use_case.dart'
    as _i287;
import 'package:aban_tether_app/presentation/home/home_bloc.dart' as _i887;
import 'package:aban_tether_app/presentation/login/login_cubit.dart' as _i263;
import 'package:aban_tether_app/presentation/profile/profile_bloc.dart'
    as _i207;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final internetConnectionModule = _$InternetConnectionModule();
    final storageModule = _$StorageModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => internetConnectionModule.connectionChecker,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => storageModule.storage);
    gh.lazySingleton<_i328.NetworkInfo>(
      () => _i328.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i437.TokenLocalDataSource>(
      () => _i437.TokenLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i485.AuthHeaderInterceptor>(
      () => _i485.AuthHeaderInterceptor(gh<_i437.TokenLocalDataSource>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.createAuthSecureClient(gh<_i485.AuthHeaderInterceptor>()),
      instanceName: 'authHttpClient',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.createCoinClient(gh<_i485.AuthHeaderInterceptor>()),
      instanceName: 'HttpClient',
    );
    gh.lazySingleton<_i636.CoinRemoteDataSource>(
      () => _i636.CoinRemoteDataSourceImp(
        gh<_i361.Dio>(instanceName: 'HttpClient'),
      ),
    );
    gh.lazySingleton<_i1041.AuthRemoteDataSource>(
      () => _i1041.AuthRemoteDataSourceImp(
        gh<_i361.Dio>(instanceName: 'authHttpClient'),
      ),
    );
    gh.lazySingleton<_i853.AuthRepository>(
      () => _i362.AuthRepositoryImpl(
        gh<_i1041.AuthRemoteDataSource>(),
        gh<_i437.TokenLocalDataSource>(),
        gh<_i328.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i756.CoinRepository>(
      () => _i693.CoinRepositoryImpl(
        gh<_i636.CoinRemoteDataSource>(),
        gh<_i328.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i543.GetTokenUseCase>(
      () => _i543.GetTokenUseCase(gh<_i853.AuthRepository>()),
    );
    gh.lazySingleton<_i168.GetUserProfileUseCase>(
      () => _i168.GetUserProfileUseCase(gh<_i853.AuthRepository>()),
    );
    gh.lazySingleton<_i86.LoginUseCase>(
      () => _i86.LoginUseCase(gh<_i853.AuthRepository>()),
    );
    gh.lazySingleton<_i287.UpdatePhoneNumberUseCase>(
      () => _i287.UpdatePhoneNumberUseCase(gh<_i853.AuthRepository>()),
    );
    gh.factory<_i263.LoginCubit>(
      () => _i263.LoginCubit(gh<_i86.LoginUseCase>()),
    );
    gh.lazySingleton<_i501.GetCoinsUseCase>(
      () => _i501.GetCoinsUseCase(gh<_i756.CoinRepository>()),
    );
    gh.factory<_i207.ProfileBloc>(
      () => _i207.ProfileBloc(
        getProfileUseCase: gh<_i168.GetUserProfileUseCase>(),
        updatePhoneUseCase: gh<_i287.UpdatePhoneNumberUseCase>(),
      ),
    );
    gh.factory<_i887.HomeBloc>(
      () => _i887.HomeBloc(gh<_i501.GetCoinsUseCase>()),
    );
    return this;
  }
}

class _$InternetConnectionModule extends _i317.InternetConnectionModule {}

class _$StorageModule extends _i188.StorageModule {}

class _$DioModule extends _i463.DioModule {}
