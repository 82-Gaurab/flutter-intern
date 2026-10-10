import 'package:shared_preferences/shared_preferences.dart';

class UserSessionService {
  final SharedPreferences _sharedPreferences;

  UserSessionService({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  static const String _keyIsLoggedIn = "is_logged_in";
  static const String _keyUsername = "username";
  static const String _keyUserId = "user_id";
  static const String _keyEmail = "email";

  Future<void> saveUserSession({
    required String userId,
    required String email,
    required String username,
  }) async {
    await _sharedPreferences.setBool(_keyIsLoggedIn, true);
    await _sharedPreferences.setString(_keyUserId, userId);
    await _sharedPreferences.setString(_keyEmail, email);
    await _sharedPreferences.setString(_keyUsername, username);
  }

  Future<void> clearUserSession() async {
    await _sharedPreferences.remove(_keyUserId);
    await _sharedPreferences.remove(_keyUsername);
    await _sharedPreferences.remove(_keyEmail);
    await _sharedPreferences.setBool(_keyIsLoggedIn, false);
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool(_keyIsLoggedIn) ?? false;
  }

  String? getUserId() {
    return _sharedPreferences.getString(_keyUserId);
  }

  String? getUsername() {
    return _sharedPreferences.getString(_keyUsername);
  }

  String? getEmail() {
    return _sharedPreferences.getString(_keyEmail);
  }
}
