import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:my_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:my_app/feature/auth/presentation/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;

  AuthCubit(
    super.initialState, {
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
  }) : _loginUsecase = loginUsecase,
       _registerUsecase = registerUsecase;

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
}
