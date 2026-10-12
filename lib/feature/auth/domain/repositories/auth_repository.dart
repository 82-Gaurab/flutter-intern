import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<AuthEntity?> login(String email, String password);
  Future<AuthEntity?> signInWithGoogle();
  Future<AuthEntity?> register(String username, String email, String password);
  Future<AuthEntity?> getCurrentUser();
  Future<AuthEntity?> updateCredentials(
    String? username,
    String? email,
    String? password,
  );
  Future<bool> signout();
}
