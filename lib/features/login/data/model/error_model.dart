class ErrorModel {
  final String message;
  final Map<String, dynamic>? errors;

  ErrorModel({required this.message, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(message: json['message'], errors: json['errors']);
  }
}
