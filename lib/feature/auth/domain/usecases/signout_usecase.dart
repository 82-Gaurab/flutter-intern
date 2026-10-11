import 'package:my_app/core/usecases/app_usecase.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';

class SignoutUsecase implements UseCaseWithoutParams<bool> {
  final IAuthRepository _authRepository;

  SignoutUsecase({required this._authRepository});

  @override
  Future<bool> call() {
    return _authRepository.signout();
  }
}
