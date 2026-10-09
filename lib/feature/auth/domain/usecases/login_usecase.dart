import 'package:my_app/core/usecases/app_usecase.dart';
import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';

class LoginUsecaseParams {
  final String email;
  final String password;

  const LoginUsecaseParams({required this.email, required this.password});
}

class LoginUsecase
    implements UseCaseWithParams<AuthEntity?, LoginUsecaseParams> {
  final IAuthRepository _authRepository;

  LoginUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<AuthEntity?> call(LoginUsecaseParams params) {
    return _authRepository.login(params.email, params.password);
  }
}
