import 'package:my_app/core/usecases/app_usecase.dart';
import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUsecase implements UseCaseWithoutParams<AuthEntity?> {
  final IAuthRepository _authRepository;

  GetCurrentUserUsecase({required this._authRepository});

  @override
  Future<AuthEntity?> call() {
    return _authRepository.getCurrentUser();
  }
}
