import 'data.dart';

class Cartresponse_ {
  bool? success;
  String? message;
  Data_? data;

  Cartresponse_({this.success, this.message, this.data});

  factory Cartresponse_.fromJson(Map<String, dynamic> json) => Cartresponse_(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data_.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
