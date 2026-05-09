class RequestLoginModel {
  final String email;
  final String password;

  RequestLoginModel({required this.email, required this.password});

  factory RequestLoginModel.fromJson(Map<String, dynamic> json) {
    return RequestLoginModel(
      email: json['login'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'login': email, 'password': password};
  }
}
