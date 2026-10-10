import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/core/services/storage/user_session_service.dart';
import 'package:my_app/feature/auth/data/datasources/auth_datasource.dart';
import 'package:my_app/feature/auth/data/models/auth_model.dart';

class AuthRemoteDatasource implements IAuthDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserSessionService _userSessionService;

  AuthRemoteDatasource({required UserSessionService userSessionService})
    : _userSessionService = userSessionService;

  @override
  Future<AuthModel?> getCurrentUser() async {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    return AuthModel(
      authId: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      username: firebaseUser.displayName,
    );
  }

  @override
  Future<AuthModel?> register(
    String username,
    String email,
    String password,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final firebaseUser = userCredential.user;

    if (firebaseUser == null) {
      return null;
    }

    await firebaseUser.updateDisplayName(username);

    return AuthModel(
      authId: firebaseUser.uid,
      email: firebaseUser.email ?? email,
      username: username,
    );
  }

  @override
  Future<bool> signout() async {
    await _firebaseAuth.signOut();
    await _userSessionService.clearUserSession();
    return true;
  }

  @override
  Future<AuthModel?> login(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final firebaseUser = userCredential.user;

    if (firebaseUser == null) {
      return null;
    }

    await _userSessionService.saveUserSession(
      email: email,
      userId: firebaseUser.uid,
      username: firebaseUser.displayName!,
    );

    return AuthModel(
      authId: firebaseUser.uid,
      email: firebaseUser.email ?? email,
      username: firebaseUser.displayName,
    );
  }
}
