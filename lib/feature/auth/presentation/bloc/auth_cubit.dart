import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:my_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:my_app/feature/auth/presentation/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final IAuthRepository _authRepository;

  AuthCubit(
    super.initialState, {
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required IAuthRepository authRepository,
  }) : _loginUsecase = loginUsecase,
       _registerUsecase = registerUsecase,
       _authRepository = authRepository;

  Future<void> login(String email, String password) async {
    emit(AuthState(status: AuthStatus.loading));
    final user = await _loginUsecase(
      LoginUsecaseParams(email: email, password: password),
    );
    if (user != null) {
      emit(AuthState(entity: user, status: AuthStatus.authenticated));
    } else {
      emit(AuthState(errorMsg: "Error", status: AuthStatus.error));
    }
  }

  Future<void> getCurrentUser() async {
    emit(AuthState(status: AuthStatus.loading));
    final user = await _authRepository.getCurrentUser();
    if (user != null) {
      emit(AuthState(entity: user, status: AuthStatus.loaded));
    } else {
      emit(AuthState(errorMsg: "Error getting user", status: AuthStatus.error));
    }
  }

  Future<void> singOut() async {
    emit(AuthState(status: AuthStatus.loading));
    final user = await _authRepository.signout();
    if (user) {
      emit(AuthState(status: AuthStatus.unauthenticated));
    } else {
      emit(
        AuthState(errorMsg: "Error Singing out user", status: AuthStatus.error),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthState(status: AuthStatus.loading));
    final user = await _authRepository.signInWithGoogle();
    if (user != null) {
      emit(AuthState(entity: user, status: AuthStatus.authenticated));
    } else {
      emit(AuthState(errorMsg: "Error", status: AuthStatus.error));
    }
  }

  Future<void> register(String username, String email, String password) async {
    emit(AuthState(status: AuthStatus.loading));
    final user = await _registerUsecase(
      RegisterUsecaseParams(
        username: username,
        email: email,
        password: password,
      ),
    );
    if (user != null) {
      emit(AuthState(entity: user, status: AuthStatus.registered));
    } else {
      emit(AuthState(errorMsg: "Error", status: AuthStatus.error));
    }
  }

  Future<void> updateCredentials(
    String? username,
    String? email,
    String? password,
  ) async {
    emit(AuthState(status: AuthStatus.loading));
    final user = await _authRepository.updateCredentials(
      username,
      email,
      password,
    );
    if (user != null) {
      emit(AuthState(status: AuthStatus.loaded, entity: user));
    } else {
      emit(AuthState(errorMsg: "Error updating", status: AuthStatus.error));
    }
  }
}
