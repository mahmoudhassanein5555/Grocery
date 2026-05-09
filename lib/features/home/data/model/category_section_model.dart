import '../../domain/entity/category_section_entity.dart';

class CategorySectionModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String? imageUrl;
  final int mealsCount;
  final int sortOrder;
  final DateTime createdAt;

  const CategorySectionModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    this.imageUrl,
    required this.mealsCount,
    required this.sortOrder,
    required this.createdAt,
  });

  factory CategorySectionModel.fromJson(Map<String, dynamic> json) {
    return CategorySectionModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      imageUrl: json['image_url'] as String?,
      mealsCount: json['meals_count'],
      sortOrder: json['sort_order'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'image_url': imageUrl,
      'meals_count': mealsCount,
      'sort_order': sortOrder,
      'created_at': createdAt.toIso8601String(),
    };
  }

  CategorySectionEntity toEntity() {
    return CategorySectionEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      imageUrl: imageUrl,
      mealsCount: mealsCount,
      sortOrder: sortOrder,
      createdAt: createdAt,
    );
  }
}
