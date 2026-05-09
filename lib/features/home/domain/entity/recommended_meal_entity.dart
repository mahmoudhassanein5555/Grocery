import 'package:grocery1/features/home/domain/entity/products_search_entity.dart';
import 'category_entity.dart';

class RecommendedMealEntity extends Product {
  final String slug;
  final CategoryEntity category;
  final String features;
  final String recommendationReason;

  RecommendedMealEntity({
    required int id,
    required String title,
    required String description,
    required String imageUrl,
    String? offerTitle,
    required double price,
    double? discountPrice,
    required double finalPrice,
    required bool hasOffer,
    required double rating,
    required int ratingCount,
    required String brand,
    required String size,
    required int categoryId,
    int? subcategoryId,
    required bool isFeatured,
    required bool inStock,
    required bool isFavorited,
    required String createdAt,
    required this.slug,
    required this.category,
    required this.features,
    required this.recommendationReason,
  }) : super(
          id: id,
          title: title,
          description: description,
          imageUrl: imageUrl,
          offerTitle: offerTitle,
          price: price,
          discountPrice: discountPrice,
          finalPrice: finalPrice,
          hasOffer: hasOffer,
          rating: rating,
          ratingCount: ratingCount,
          brand: brand,
          size: size,
          categoryId: categoryId,
          subcategoryId: subcategoryId,
          isFeatured: isFeatured,
          inStock: inStock,
          isFavorited: isFavorited,
          createdAt: createdAt,
        );

  List<String> get featureList => features
      .split(',')
      .map((f) => f.trim())
      .where((f) => f.isNotEmpty)
      .toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendedMealEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'RecommendedMealEntity(id: $id, title: $title)';
}
