import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';

class AddToCartModel {
  bool? success;
  String? message;

  AddToCartModel({this.success, this.message});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  AddToCartEntity toEntity() => AddToCartEntity(
        success: success ?? false,
        message: message ?? '',
      );
}
