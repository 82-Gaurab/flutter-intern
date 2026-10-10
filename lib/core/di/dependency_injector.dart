import 'package:get_it/get_it.dart';
import 'package:my_app/feature/auth/data/datasources/auth_datasource.dart';
import 'package:my_app/feature/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:my_app/feature/auth/data/repositories/auth_repo_iml.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:my_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:my_app/feature/auth/presentation/auth_state.dart';
import 'package:my_app/feature/auth/presentation/bloc/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  // Data source
  getIt.registerLazySingleton<IAuthDatasource>(() => AuthRemoteDatasource());

  // repository
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepoIml(getIt<IAuthDatasource>()),
  );

  // use cases
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(authRepository: getIt<IAuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(authRepository: getIt<IAuthRepository>()),
  );

  // cubit
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      AuthState(status: AuthStatus.initial),
      loginUsecase: getIt<LoginUsecase>(),
      registerUsecase: getIt<RegisterUsecase>(),
    ),
  );
}
