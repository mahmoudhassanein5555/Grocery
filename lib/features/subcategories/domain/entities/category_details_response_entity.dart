class CategoryDetailsResponseEntity {
  bool? success;
  String? message;
  DataOfCategoryDetailsEntity? data;

  CategoryDetailsResponseEntity({
    this.success,
    this.message,
    this.data,
  });
}

class DataOfCategoryDetailsEntity {
  num? id;
  String? name;
  String? slug;
  String? description;
  String? imageUrl;
  num? sortOrder;
  List<CategoryDetailsMealsEntity>? meals;
  String? createdAt;
  String? updatedAt;

  DataOfCategoryDetailsEntity({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.imageUrl,
    this.sortOrder,
    this.meals,
    this.createdAt,
    this.updatedAt,
  });
}

class CategoryDetailsMealsEntity {
  num? id;
  String? title;
  String? slug;
  String? description;
  String? imageUrl;
  String? offerTitle;
  num? price;
  num? discountPrice;
  num? finalPrice;
  num? rating;
  num? ratingCount;
  bool? hasOffer;
  bool? isFeatured;
  String? features;

  CategoryDetailsMealsEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imageUrl,
    this.offerTitle,
    this.price,
    this.discountPrice,
    this.finalPrice,
    this.rating,
    this.ratingCount,
    this.hasOffer,
    this.isFeatured,
    this.features,
  });
}
