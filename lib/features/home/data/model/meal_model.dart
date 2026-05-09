import '../../domain/entity/meal_entity.dart';
import 'category_model.dart';

class MealModel {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String imageUrl;
  final String? offerTitle;
  final double price;
  final double? discountPrice;
  final double finalPrice;
  final bool hasOffer;
  final CategoryModel category;
  final String features;
  final DateTime? availableDate;
  final DateTime createdAt;

  const MealModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imageUrl,
    this.offerTitle,
    required this.price,
    this.discountPrice,
    required this.finalPrice,
    required this.hasOffer,
    required this.category,
    required this.features,
    this.availableDate,
    required this.createdAt,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imageUrl: json['image_url'],
      offerTitle: json['offer_title'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,
      finalPrice: (json['final_price'] as num).toDouble(),
      hasOffer: json['has_offer'],
      category: CategoryModel.fromJson(json['category']),
      features: json['features'],
      availableDate: json['available_date'] != null
          ? DateTime.parse(json['available_date'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'image_url': imageUrl,
      'offer_title': offerTitle,
      'price': price,
      'discount_price': discountPrice,
      'final_price': finalPrice,
      'has_offer': hasOffer,
      'category': category.toJson(),
      'features': features,
      'available_date': availableDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }

  MealEntity toEntity() {
    return MealEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imageUrl: imageUrl,
      offerTitle: offerTitle,
      price: price,
      discountPrice: discountPrice,
      finalPrice: finalPrice,
      hasOffer: hasOffer,
      category: category,
      features: features,
      availableDate: availableDate,
      createdAt: createdAt,
    );
  }
}
