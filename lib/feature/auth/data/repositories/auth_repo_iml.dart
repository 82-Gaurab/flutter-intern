import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/feature/auth/data/datasources/auth_datasource.dart';
import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepoIml implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepoIml(this.datasource);

  AuthException _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return AuthException('This email is already registered.');

      case 'invalid-email':
        return AuthException('Please enter a valid email address.');

      case 'weak-password':
        return AuthException('Your password is too weak.');

      case 'user-not-found':
        return AuthException('No account found for this email.');

      case 'wrong-password':
      case 'invalid-credential':
        return AuthException('Invalid email or password.');

      case 'network-request-failed':
        return AuthException('Please check your internet connection.');

      case 'too-many-requests':
        return AuthException('Too many attempts. Please try again later.');

      default:
        return AuthException(e.message ?? 'Authentication failed.');
    }
  }

  @override
  Future<AuthEntity?> register(
    String username,
    String email,
    String password,
  ) async {
    try {
      final model = await datasource.register(username, email, password);

      if (model == null) return null;

      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  @override
  Future<AuthEntity?> login(String email, String password) async {
    try {
      final model = await datasource.login(email, password);

      if (model == null) return null;

      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  @override
  Future<AuthEntity?> getCurrentUser() async {
    try {
      final model = await datasource.getCurrentUser();

      if (model == null) return null;

      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  @override
  Future<bool> signout() async {
    try {
      return await datasource.signout();
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
}
