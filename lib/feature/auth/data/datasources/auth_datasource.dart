import 'package:my_app/feature/auth/data/models/auth_model.dart';

abstract interface class IAuthDatasource {
  Future<AuthModel?> login(String email, String password);
  Future<AuthModel?> register(String username, String email, String password);
  Future<AuthModel?> getCurrentUser();
  Future<bool> signout();
}
