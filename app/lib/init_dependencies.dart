import 'package:app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/common/cubits/app_user/app_user_cubit.dart';
import 'core/helper/connection_checker.dart';
import 'core/helper/constants.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/current_user.dart';
import 'features/auth/domain/usecases/user_login.dart';
import 'features/auth/domain/usecases/user_sign_up.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/blog/data/datasources/blog_local_data_source.dart';
import 'features/blog/data/datasources/blog_remote_data_source.dart';
import 'features/blog/data/repositories/blog_repo_impl.dart';
import 'features/blog/domain/usecases/get_all_blogs.dart';
import 'features/blog/domain/usecases/upload_blog.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBlog();

  final supabase = await Supabase.initialize(
    url: AppSupabase.supabaseUrl,
    anonKey: AppSupabase.supabaseAnonKey,
  );
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  serviceLocator
    ..registerLazySingleton(() => supabase.client)
    ..registerLazySingleton(() => Hive.box(name: 'blogs'));
  //* core - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  serviceLocator
    ..registerLazySingleton(() => AppUserCubit())
    ..registerFactory(() => ConnectionCheckerImpl(serviceLocator()));
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

void _initBlog() {
  serviceLocator
    //* DataSource - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerFactory(() => BlogRemoteDataSourceImpl(serviceLocator()))
    ..registerFactory(() => BlogLocalDataSourceImpl(serviceLocator()))
    //* Repository - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerFactory(() => BlogRepoImpl(serviceLocator(), serviceLocator(), serviceLocator()))
    //* Usecases - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerFactory(() => GetAllBlogs(serviceLocator()))
    ..registerFactory(() => UploadBlog(serviceLocator()))

    //* Bloc - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ..registerLazySingleton(() => BlogBloc(
          uploadBlog: serviceLocator(),
          getAllBlogs: serviceLocator(),
        ));
}
