class RegisterResponseEntity {
  final bool? success;
  final String? message;
  final DataEntity? data;

  RegisterResponseEntity({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) {
    return RegisterResponseEntity(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? DataEntity.fromJson(json['data']) : null,
    );
  }
}

class DataEntity {
  final UserEntity? user;
  final String? token;

  DataEntity({
    this.user,
    this.token,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      user: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
}

class UserEntity {
  final num? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? createdAt;

  UserEntity({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.createdAt,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['created_at'],
    );
  }
}

class ErrorEntity {
  final String message;
  final Map<String, List<String>> errors;

  ErrorEntity({
    required this.message,
    required this.errors,
  });
}
