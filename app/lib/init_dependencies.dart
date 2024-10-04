import 'package:app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/common/cubits/app_user/app_user_cubit.dart';
import 'core/helper/constants.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/current_user.dart';
import 'features/auth/domain/usecases/user_login.dart';
import 'features/auth/domain/usecases/user_sign_up.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSupabase.supabaseUrl,
    anonKey: AppSupabase.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
  //* core - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    //* DataSource - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerFactory(() => AuthRemoteDataSourceImpl(serviceLocator()))
    //* Repository - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerFactory(() => AuthRepositoryImpl(serviceLocator()))
    //* Usecases - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))

    //* Bloc - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerLazySingleton(
      () => AuthBloc(
        userLogin: serviceLocator(),
        userSignUp: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
