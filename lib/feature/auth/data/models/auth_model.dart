import 'package:my_app/feature/auth/domain/entities/auth_entity.dart';

class AuthModel {
  final String? authId;
  final String email;
  final String? username;
  final String? password;

  AuthModel({this.authId, required this.email, this.password, this.username});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      authId: json["authId"],
      email: json["email"],
      password: json["password"],
      username: 'username',
    );
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "email": email, "password": password};
  }

  AuthEntity toEntity() {
    return AuthEntity(authId: authId, username: username, email: email);
  }

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }
}
