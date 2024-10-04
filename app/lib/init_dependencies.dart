import 'package:app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper/constants.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
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
}

void _initAuth() {
  //* DataSource - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  serviceLocator.registerFactory(() => AuthRemoteDataSourceImpl(serviceLocator()));
  //* Repository - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  serviceLocator.registerFactory(() => AuthRepositoryImpl(serviceLocator()));
  //* Usecases - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));

  //* Bloc - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  serviceLocator.registerLazySingleton(() => AuthBloc(serviceLocator()));
}
/*
AuthBloc(
            UserSignUp(
              AuthRepositoryImpl(
                AuthRemoteDataSourceImpl(
                  SupabaseClient("", ""),
                ),
              ),
            ),
          ),
 */