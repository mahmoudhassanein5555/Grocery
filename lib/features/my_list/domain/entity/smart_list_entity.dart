class SmartListResponseEntity {
  bool success;
  String message;
  List<SmartListEntity> data;

  SmartListResponseEntity({
    this.success = false,
    this.message = "",
    this.data = const [],
  });
}

class SmartListEntity {
  int id;
  String title;
  int itemCount;
  String updatedAt;
  String imageUrl;
  List<MealsEntity> meals;

  SmartListEntity({
    this.id = 0,
    this.title = "",
    this.itemCount = 0,
    this.updatedAt = "",
    this.imageUrl = "",
    this.meals = const [],
  });
}

class MealsEntity {
  int id;
  String title;
  String slug;
  String description;
  String imageUrl;
  String offerTitle;

  MealsEntity({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.description = '',
    this.imageUrl = '',
    this.offerTitle = '',
  });
}
