import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';

class HistoryModel {
  int? id;
  String? title;
  String? subtitle;
  double? rating;
  int? ratingCount;
  double? price;
  double? originalPrice;
  String? imageUrl;
  bool? isFavorite;

  HistoryModel({
    this.id,
    this.title,
    this.subtitle,
    this.rating,
    this.ratingCount,
    this.price,
    this.originalPrice,
    this.imageUrl,
    this.isFavorite,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    rating = json['rating']?.toDouble() ?? json['rate']?.toDouble();
    ratingCount = json['rating_count'] ?? json['rate_count'];
    price = json['price']?.toDouble();
    originalPrice = json['original_price']?.toDouble();
    imageUrl = json['image_url'];
    isFavorite = json['is_favorite'] == 1 || json['is_favorite'] == true;
  }

  HistoryEntity toEntity() => HistoryEntity(
        id: id ?? 0,
        title: title ?? '',
        subtitle: subtitle ?? '',
        rating: rating ?? 0.0,
        ratingCount: ratingCount ?? 0,
        price: price ?? 0.0,
        originalPrice: originalPrice ?? 0.0,
        imageUrl: imageUrl ?? '',
        isFavorite: isFavorite ?? false,
      );
}

class HistoryResponseModel {
  bool? success;
  String? message;
  List<HistoryModel>? data;

  HistoryResponseModel({this.success, this.message, this.data});

  HistoryResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HistoryModel>[];
      json['data'].forEach((order) {
        if (order['items'] != null) {
          order['items'].forEach((item) {
            if (item['meal'] != null) {
              data!.add(HistoryModel.fromJson(item['meal']));
            }
          });
        }
      });
    }
  }

  List<HistoryEntity> toEntity() =>
      data?.map((e) => e.toEntity()).toList() ?? [];
}
