import 'package:grocery1/features/subcategories/domain/entities/categories_response_entity.dart';

/// success : true
/// message : "Categories retrieved successfully"
/// data : [{"id":7,"name":"Test_Cate","slug":"test-cate","description":"Test_Cate","image_url":null,"meals_count":0,"sort_order":1,"created_at":"2026-02-05T16:44:52.000000Z"},{"id":1,"name":"Vegetables","slug":"vegetables","description":"Fresh organic vegetables","image_url":null,"meals_count":2,"sort_order":1,"created_at":"2026-01-12T19:55:52.000000Z"},{"id":2,"name":"Fruits","slug":"fruits","description":"Fresh seasonal fruits","image_url":"https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=400","meals_count":2,"sort_order":2,"created_at":"2026-01-12T19:55:52.000000Z"},{"id":3,"name":"Dairy Products","slug":"dairy-products","description":"Milk, cheese, yogurt and more","image_url":"https://images.unsplash.com/photo-1628088062854-d1870b4553da?w=400","meals_count":1,"sort_order":3,"created_at":"2026-01-12T19:55:52.000000Z"},{"id":4,"name":"Meat & Poultry","slug":"meat-poultry","description":"Fresh meat and poultry products","image_url":"https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400","meals_count":2,"sort_order":4,"created_at":"2026-01-12T19:55:52.000000Z"},{"id":5,"name":"Bakery","slug":"bakery","description":"Fresh bread and baked goods","image_url":"https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400","meals_count":2,"sort_order":5,"created_at":"2026-01-12T19:55:52.000000Z"},{"id":6,"name":"Beverages","slug":"beverages","description":"Drinks and refreshments","image_url":"https://images.unsplash.com/photo-1437418747212-8d9709afab22?w=400","meals_count":0,"sort_order":6,"created_at":"2026-01-12T19:55:52.000000Z"}]

class CategoriesResponseDm extends CategoriesResponseEntity {
  CategoriesResponseDm({
    super.success,
    super.message,
    super.data,
  });

  factory CategoriesResponseDm.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseDm(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List? ?? []).map((e) => DataDM.fromJson(e)).toList(),
    );
  }
}

class DataDM extends DataEntity {
  DataDM({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    super.imageUrl,
    required super.mealsCount,
    required super.sortOrder,
    required super.createdAt,
  });

  factory DataDM.fromJson(Map<String, dynamic> json) {
    return DataDM(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'],
      mealsCount: json['meals_count'] ?? 0,
      sortOrder: json['sort_order'] ?? 0,
      createdAt: json['created_at'] ?? '',
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
      'created_at': createdAt,
    };
  }
}
