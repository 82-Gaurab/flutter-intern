import 'package:my_app/core/usecases/app_usecase.dart';
import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUsecaseParams {
  final String username;
  final String email;
  final String password;

  const RegisterUsecaseParams({
    required this.username,
    required this.email,
    required this.password,
  });
}

class RegisterUsecase
    implements UseCaseWithParams<AuthEntity?, RegisterUsecaseParams> {
  final IAuthRepository _authRepository;

  RegisterUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<AuthEntity?> call(RegisterUsecaseParams params) {
    return _authRepository.register(
      params.username,
      params.email,
      params.password,
    );
  }
}
