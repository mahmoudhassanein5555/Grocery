import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';

class FavoriteToggleDataModel {
  bool? success;
  String? message;
  DataModel? data;

  FavoriteToggleDataModel({this.success, this.message, this.data});

  FavoriteToggleDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  FavoriteToggleDataEntity toEntity() => FavoriteToggleDataEntity(
        success: success ?? false,
        message: message ?? '',
        data: data!.toEntity(),
      );
}

class DataModel {
  int? mealId;
  bool? isFavorited;

  DataModel({this.mealId, this.isFavorited});

  DataModel.fromJson(Map<String, dynamic> json) {
    mealId = json['meal_id'];
    isFavorited = json['is_favorited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meal_id'] = this.mealId;
    data['is_favorited'] = this.isFavorited;
    return data;
  }

  DataEntity toEntity() =>
      DataEntity(mealId: mealId ?? 0, isFavorited: isFavorited ?? false);
}
