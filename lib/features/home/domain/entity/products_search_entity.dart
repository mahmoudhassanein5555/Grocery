class ProductSearchEntity {
  final List<Product> products;
  final int totalCount;
  final ProductFilters filtersApplied;
  final String? emptyMessage;

  ProductSearchEntity({
    required this.products,
    required this.totalCount,
    required this.filtersApplied,
    this.emptyMessage,
  });
}

class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String? offerTitle;
  final double price;
  final double? discountPrice;
  final double finalPrice;
  final bool hasOffer;
  final double rating;
  final int ratingCount;
  final String brand;
  final String size;
  final int categoryId;
  final int? subcategoryId;
  final bool isFeatured;
  final bool inStock;
  final bool isFavorited;
  final String createdAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.offerTitle,
    required this.price,
    this.discountPrice,
    required this.finalPrice,
    required this.hasOffer,
    required this.rating,
    required this.ratingCount,
    required this.brand,
    required this.size,
    required this.categoryId,
    this.subcategoryId,
    required this.isFeatured,
    required this.inStock,
    required this.isFavorited,
    required this.createdAt,
  });

  bool get hasDiscount =>
      discountPrice != null && discountPrice! > 0 && discountPrice! < price;

  double get discountPercentage {
    if (!hasDiscount) return 0;
    return ((price - discountPrice!) / price) * 100;
  }
}

class ProductFilters {
  final String? search;
  final int? categoryId;
  final int? subcategoryId;
  final double? minPrice;
  final double? maxPrice;
  final double? minRating;
  final String? brand;
  final bool? featured;
  final bool? inStock;
  final String? sortBy;
  final String? sortOrder;

  ProductFilters({
    this.search,
    this.categoryId,
    this.subcategoryId,
    this.minPrice,
    this.maxPrice,
    this.minRating,
    this.brand,
    this.featured,
    this.inStock,
    this.sortBy,
    this.sortOrder,
  });
}
