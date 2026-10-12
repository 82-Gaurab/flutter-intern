import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/feature/auth/data/datasources/auth_datasource.dart';
import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';
import 'package:my_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthRepoIml implements IAuthRepository {
  final IAuthDatasource datasource;
  final Talker talker;

  AuthRepoIml(this.datasource, this.talker);

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

      talker.info("Registration Successfull");

      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      talker.warning("Firebase registration failed: ${e.code}");
      throw _handleFirebaseError(e);
    } catch (err, stackTrace) {
      talker.handle(err, stackTrace, "Unexpected error during registration");
      rethrow;
    }
  }

  @override
  Future<AuthEntity?> login(String email, String password) async {
    try {
      final model = await datasource.login(email, password);

      if (model == null) return null;

      talker.info("Login Successfull");

      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      talker.warning("Firebase login failed: ${e.code}");
      throw _handleFirebaseError(e);
    } catch (err, stackTrace) {
      talker.handle(err, stackTrace, "Unexpected error during login");
      rethrow;
    }
  }

  @override
  Future<AuthEntity?> getCurrentUser() async {
    try {
      final model = await datasource.getCurrentUser();

      if (model == null) return null;
      talker.info("Current user Fetched success");

      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      talker.warning("Firebase user fetching failer: ${e.code}");
      throw _handleFirebaseError(e);
    } catch (err, stackTrace) {
      talker.handle(err, stackTrace, "Unexpected error during fetching user");
      rethrow;
    }
  }

  @override
  Future<bool> signout() async {
    try {
      talker.info("Starting Sign Out process");
      final success = await datasource.signout();
      talker.info("Sign out successfull");
      return success;
    } on FirebaseAuthException catch (e) {
      talker.warning("Failed to sign out: ${e.code}");
      throw _handleFirebaseError(e);
    }
  }

  @override
  Future<AuthEntity?> signInWithGoogle() async {
    try {
      final model = await datasource.signInWithGoogle();
      if (model == null) return null;
      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      talker.warning("Sign in with google failed: ${e.code}");
      throw _handleFirebaseError(e);
    } catch (err, stackTrace) {
      talker.handle(
        err,
        stackTrace,
        "Unexpected error during sign in with google",
      );
      rethrow;
    }
  }

  @override
  Future<AuthEntity?> updateCredentials(
    String? username,
    String? email,
    String? password,
  ) async {
    try {
      final model = await datasource.updateCredentials(
        username,
        email,
        password,
      );
      if (model == null) return null;
      return model.toEntity();
    } on FirebaseAuthException catch (e) {
      talker.warning("Firebase Update Credentials failed: ${e.code}");
      throw _handleFirebaseError(e);
    } catch (err, stackTrace) {
      talker.handle(err, stackTrace, "Unexpected error during update");
      rethrow;
    }
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
}
