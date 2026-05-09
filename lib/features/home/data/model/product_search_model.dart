import '../../domain/entity/products_search_entity.dart';

class ProductSearchModel extends ProductSearchEntity {
  ProductSearchModel({
    required List<ProductModel> products,
    required int totalCount,
    required ProductFiltersModel filtersApplied,
    String? emptyMessage,
  }) : super(
          products: products,
          totalCount: totalCount,
          filtersApplied: filtersApplied,
          emptyMessage: emptyMessage,
        );

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) {
    return ProductSearchModel(
      products:
          (json['data'] as List).map((e) => ProductModel.fromJson(e)).toList(),
      totalCount: json['total_count'] ?? 0,
      filtersApplied:
          ProductFiltersModel.fromJson(json['filters_applied'] ?? {}),
      emptyMessage: json['empty_message'],
    );
  }
}

class ProductModel extends Product {
  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      offerTitle: json['offer_title'],
      price: (json['price'] ?? 0).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price']).toDouble()
          : null,
      finalPrice: (json['final_price'] ?? json['price'] ?? 0).toDouble(),
      hasOffer: json['has_offer'] ?? false,
      rating: (json['rating'] ?? 0).toDouble(),
      ratingCount: json['rating_count'] ?? 0,
      brand: json['brand'] ?? '',
      size: json['size'] ?? '',
      categoryId: json['category']?['id'] ?? 0,
      subcategoryId: json['subcategory']?['id'],
      isFeatured: json['is_featured'] ?? false,
      inStock: json['in_stock'] ?? false,
      isFavorited: json['is_favorited'] ?? false,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class ProductFiltersModel extends ProductFilters {
  ProductFiltersModel({
    String? search,
    int? categoryId,
    int? subcategoryId,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    String? brand,
    bool? featured,
    bool? inStock,
    String? sortBy,
    String? sortOrder,
  }) : super(
          search: search,
          categoryId: categoryId,
          subcategoryId: subcategoryId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          minRating: minRating,
          brand: brand,
          featured: featured,
          inStock: inStock,
          sortBy: sortBy,
          sortOrder: sortOrder,
        );

  factory ProductFiltersModel.fromJson(Map<String, dynamic> json) {
    return ProductFiltersModel(
      search: json['search'],
      categoryId: int.tryParse(json['category_id'].toString()),
      subcategoryId: int.tryParse(json['subcategory_id'].toString()),
      minPrice: double.tryParse(json['min_price'].toString()),
      maxPrice: double.tryParse(json['max_price'].toString()),
      minRating: double.tryParse(json['min_rating'].toString()),
      brand: json['brand'],
      featured: json['featured'],
      inStock: json['in_stock'],
      sortBy: json['sort_by'],
      sortOrder: json['sort_order'],
    );
  }
}
