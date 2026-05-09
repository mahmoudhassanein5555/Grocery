import 'package:grocery1/features/signup/domain/entities/register_response_entity.dart';

class RegisterResponseModel extends RegisterResponseEntity {
  RegisterResponseModel({
    bool? success,
    String? message,
    DataModel? data,
  }) : super(
          success: success,
          message: message,
          data: data,
        );

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
    );
  }
}

class DataModel extends DataEntity {
  DataModel({
    UserModel? user,
    String? token,
  }) : super(user: user, token: token);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
}

class UserModel extends UserEntity {
  UserModel({
    num? id,
    String? username,
    String? email,
    String? phone,
    String? createdAt,
  }) : super(
          id: id,
          username: username,
          email: email,
          phone: phone,
          createdAt: createdAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['created_at'],
    );
  }
}

class ErrorModel extends ErrorEntity {
  ErrorModel({
    required String message,
    required Map<String, List<String>> errors,
  }) : super(message: message, errors: errors);

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'] ?? '',
      errors: (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          List<String>.from(value),
        ),
      ),
    );
  }
}
