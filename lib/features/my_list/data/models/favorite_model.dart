import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';

class FavoriteModel {
  int? id;
  String? title;
  double? price;
  double? originalPrice;
  String? imageUrl;

  FavoriteModel({
    this.id,
    this.title,
    this.price,
    this.originalPrice,
    this.imageUrl,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price']?.toDouble();
    originalPrice = json['original_price']?.toDouble();
    imageUrl = json['image_url'];
  }

  FavoriteEntity toEntity() => FavoriteEntity(
        id: id ?? 0,
        title: title ?? '',
        price: price ?? 0.0,
        originalPrice: originalPrice ?? 0.0,
        imageUrl: imageUrl ?? '',
      );
}

class FavoriteResponseModel {
  bool? success;
  String? message;
  List<FavoriteModel>? data;

  FavoriteResponseModel({this.success, this.message, this.data});

  FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FavoriteModel>[];
      json['data'].forEach((v) {
        data!.add(FavoriteModel.fromJson(v));
      });
    }
  }

  List<FavoriteEntity> toEntity() =>
      data?.map((e) => e.toEntity()).toList() ?? [];
}
