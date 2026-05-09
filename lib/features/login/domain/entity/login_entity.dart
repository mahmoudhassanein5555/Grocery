class UserEntity {
  final int id;
  final String username;
  final String email;
  final String? phone;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });
}

class LoginEntity {
  final UserEntity user;
  final String token;

  LoginEntity({
    required this.user,
    required this.token,
  });
}
