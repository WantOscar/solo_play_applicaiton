import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solo_play_application/src/core/router/router.dart';
import 'package:solo_play_application/src/core/style/app_theme.dart';
import 'package:solo_play_application/src/core/utils/networks/logging_interceptor.dart';
import 'package:solo_play_application/src/core/utils/observers/bloc_observer.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/jwt_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/jwt_storage_impl.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource_impl.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_logout_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/watch_user_access_token_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_event.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          RepositoryProvider<Dio>(
              create: (context) => Dio()
                ..options = BaseOptions(baseUrl: dotenv.env['BASE_URL']!)
                ..interceptors.add(LoggingInterceptor())),
          RepositoryProvider<FlutterSecureStorage>(
              create: (context) => FlutterSecureStorage()),
          RepositoryProvider<AuthDatasource>(
              create: (context) =>
                  AuthDatasourceImpl(dio: context.read<Dio>())),
          RepositoryProvider<JwtStorage>(
              create: (context) => JwtStorageImpl(
                  storage: context.read<FlutterSecureStorage>())),
          RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepositoryImpl(
                  authDatasource: context.read<AuthDatasource>(),
                  jwtStorage: context.read<JwtStorage>())),
          RepositoryProvider<WatchUserAccessTokenUseCase>(
            create: (context) => WatchUserAccessTokenUseCaseImpl(
              authRepository: context.read<AuthRepository>(),
            ),
            dispose: (usecase) => usecase.close(),
          ),
          RepositoryProvider<UserLogoutUsecase>(
              create: (context) => UserLogoutUsecaseImpl(
                  authRepository: context.read<AuthRepository>())),
          BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(
                  watchUserAccessTokenUseCase:
                      context.read<WatchUserAccessTokenUseCase>(),
                  userLogoutUsecase: context.read<UserLogoutUsecase>())
                ..add(AuthSubscriptionRequested()))
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            routerConfig: router(context.read<AuthBloc>()),
          );
        }));
  }
}
