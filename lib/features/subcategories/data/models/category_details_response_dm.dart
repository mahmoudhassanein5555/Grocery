import 'package:grocery1/features/subcategories/domain/entities/category_details_response_entity.dart';

class CategoryDetailsResponseDm extends CategoryDetailsResponseEntity {
  CategoryDetailsResponseDm({
    super.success,
    super.message,
    super.data,
  });

  CategoryDetailsResponseDm.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? DataOfCategoryDetailsDm.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        if (data != null) 'data': (data as DataOfCategoryDetailsDm).toJson(),
      };
}

class DataOfCategoryDetailsDm extends DataOfCategoryDetailsEntity {
  DataOfCategoryDetailsDm({
    super.id,
    super.name,
    super.slug,
    super.description,
    super.imageUrl,
    super.sortOrder,
    super.meals,
    super.createdAt,
    super.updatedAt,
  });

  DataOfCategoryDetailsDm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    imageUrl = json['image_url'];
    sortOrder = json['sort_order'];
    meals = (json['meals'] as List?)
        ?.map((v) => CategoryDetailsMealsDm.fromJson(v))
        .toList();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': description,
        'image_url': imageUrl,
        'sort_order': sortOrder,
        if (meals != null)
          'meals': meals!
              .map((v) => (v as CategoryDetailsMealsDm).toJson())
              .toList(),
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class CategoryDetailsMealsDm extends CategoryDetailsMealsEntity {
  CategoryDetailsMealsDm({
    super.id,
    super.title,
    super.slug,
    super.description,
    super.imageUrl,
    super.offerTitle,
    super.price,
    super.discountPrice,
    super.finalPrice,
    super.rating,
    super.ratingCount,
    super.hasOffer,
    super.isFeatured,
    super.features,
  });

  CategoryDetailsMealsDm.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imageUrl = json['image_url'];
    offerTitle = json['offer_title'];
    price = json['price'];
    discountPrice = json['discount_price'];
    finalPrice = json['final_price'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    hasOffer = json['has_offer'];
    isFeatured = json['is_featured'];
    features = json['features'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'image_url': imageUrl,
        'offer_title': offerTitle,
        'price': price,
        'discount_price': discountPrice,
        'final_price': finalPrice,
        'rating': rating,
        'rating_count': ratingCount,
        'has_offer': hasOffer,
        'is_featured': isFeatured,
        'features': features,
      };
}
