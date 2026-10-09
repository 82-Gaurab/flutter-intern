class AuthEntity {
  final String? authId;
  final String email;
  final String? username;
  final String? password;

  new({
    this.authId,
    required this.email,
    required this.username,
    this.password,
  });
}
