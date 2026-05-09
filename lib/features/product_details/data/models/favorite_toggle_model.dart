import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';

class FavoriteToggleDataModel {
  int? mealId;
  bool? isFavorited;

  FavoriteToggleDataModel({this.mealId, this.isFavorited});

  FavoriteToggleDataModel.fromJson(Map<String, dynamic> json) {
    mealId = json['meal_id'];
    isFavorited = json['is_favorited'];
  }

  FavoriteToggleDataEntity toEntity() => FavoriteToggleDataEntity(
        mealId: mealId ?? 0,
        isFavorited: isFavorited ?? false,
      );
}

class FavoriteToggleModel {
  bool? success;
  String? message;
  FavoriteToggleDataModel? data;

  FavoriteToggleModel({this.success, this.message, this.data});

  FavoriteToggleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? FavoriteToggleDataModel.fromJson(json['data'])
        : null;
  }

  FavoriteToggleEntity toEntity() => FavoriteToggleEntity(
        success: success ?? false,
        message: message ?? '',
        data: data != null
            ? data!.toEntity()
            : const FavoriteToggleDataEntity(mealId: 0, isFavorited: false),
      );
}
