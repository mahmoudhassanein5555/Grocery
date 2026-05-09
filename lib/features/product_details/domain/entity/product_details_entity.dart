class ProductDetailsResponseEntity {
  bool success;
  String message;
  ProductEntity data;

  ProductDetailsResponseEntity({
    this.success = true,
    this.message = "",
    this.data = const ProductEntity(),
  });
}

class ProductEntity {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String imageUrl;
  final String offerTitle;
  final double price;
  final double discountPrice;
  final double finalPrice;
  final bool hasOffer;
  final double rating;
  final int ratingCount;
  final String size;
  final String brand;
  final String includes;
  final String howToUse;
  final String features;
  final String expiryDate;
  final int daysUntilExpiry;
  final bool isExpired;
  final int stockQuantity;
  final bool inStock;
  final int soldCount;
  final bool isFeatured;
  final bool isAvailable;
  final String availableDate;
  final List<dynamic> reviews;
  final String createdAt;
  final String updatedAt;
  final bool isFavorite;

  const ProductEntity({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.description = '',
    this.imageUrl = '',
    this.offerTitle = '',
    this.price = 0.0,
    this.discountPrice = 0.0,
    this.finalPrice = 0.0,
    this.hasOffer = false,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.size = '',
    this.brand = '',
    this.includes = '',
    this.howToUse = '',
    this.features = '',
    this.expiryDate = '',
    this.daysUntilExpiry = 0,
    this.isExpired = false,
    this.stockQuantity = 0,
    this.inStock = false,
    this.soldCount = 0,
    this.isFeatured = false,
    this.isAvailable = false,
    this.availableDate = '',
    this.reviews = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.isFavorite = false,
  });
}

class CategoryEntity {
  int? id;
  String? name;
  String? slug;

  CategoryEntity({this.id, this.name, this.slug});
}
