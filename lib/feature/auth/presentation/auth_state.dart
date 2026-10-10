import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  registered,
  error,
  loaded,
}

class AuthState {
  final AuthStatus status;
  final AuthEntity? entity;
  final String? errorMsg;

  const AuthState({
    this.status = AuthStatus.initial,
    this.entity,
    this.errorMsg,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthEntity? entity,
    String? errorMsg,
  }) {
    return AuthState(
      status: status ?? this.status,
      entity: entity ?? this.entity,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
