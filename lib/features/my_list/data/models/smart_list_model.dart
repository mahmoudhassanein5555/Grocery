import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';

class SmartListModel {
  int? id;
  String? title;
  int? itemCount;
  String? updatedAt;
  String? imageUrl;
  List<Meals>? meals;

  SmartListModel({
    this.id,
    this.title,
    this.itemCount,
    this.updatedAt,
    this.imageUrl,
    this.meals,
  });

  SmartListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    title = json['name'];
    imageUrl = json['image_url'];

    updatedAt = json['updated_at'] ?? "Just now";

    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(Meals.fromJson(v));
      });
    }

    itemCount = meals?.length ?? 0;
  }

  SmartListEntity toEntity() => SmartListEntity(
        id: id ?? 0,
        title: title ?? '',
        itemCount: meals?.length ?? 0,
        updatedAt: updatedAt ?? '',
        imageUrl: imageUrl ?? '',
        meals: meals?.map((e) => e.toEntity()).toList() ?? [],
      );
}

class Meals {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? imageUrl;
  String? offerTitle;

  Meals({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imageUrl,
    this.offerTitle,
  });

  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imageUrl = json['image_url'];
    offerTitle = json['offer_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['offer_title'] = this.offerTitle;
    return data;
  }

  MealsEntity toEntity() => MealsEntity(
        id: id ?? 0,
        title: title ?? '',
        slug: slug ?? '',
        description: description ?? '',
        imageUrl: imageUrl ?? '',
        offerTitle: offerTitle ?? '',
      );
}

class SmartListResponseModel {
  bool? success;
  String? message;
  List<SmartListModel>? data;

  SmartListResponseModel({this.success, this.message, this.data});

  SmartListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SmartListModel>[];
      json['data'].forEach((v) {
        data!.add(SmartListModel.fromJson(v));
      });
    }
  }

  List<SmartListEntity> toEntity() =>
      data?.map((e) => e.toEntity()).toList() ?? [];
}
