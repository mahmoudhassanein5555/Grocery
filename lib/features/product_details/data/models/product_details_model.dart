import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';

class ProductDetailsResponseModel {
  bool? success;
  String? message;
  ProductModel? data;
  ProductDetailsResponseModel({this.success, this.message, this.data});
  ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ProductModel.fromJson(json['data']) : null;
  }
  ProductDetailsResponseEntity toEntity() => ProductDetailsResponseEntity(
        success: success ?? false,
        message: message ?? '',
        data: data!.toEntity(),
      );
}

class ProductModel {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? imageUrl;
  String? offerTitle;
  double? price;
  double? discountPrice;
  double? finalPrice;
  bool? hasOffer;
  double? rating;
  int? ratingCount;
  String? size;
  String? brand;
  String? includes;
  String? howToUse;
  String? features;
  String? expiryDate;
  int? daysUntilExpiry;
  bool? isExpired;
  int? stockQuantity;
  bool? inStock;
  int? soldCount;
  bool? isFeatured;
  bool? isAvailable;
  String? availableDate;
  CategoryModel? category;
  List<dynamic>? reviews;
  CategoryModel? subcategory;
  String? createdAt;
  String? updatedAt;
  bool? isFavorite;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imageUrl,
    this.offerTitle,
    this.price,
    this.discountPrice,
    this.finalPrice,
    this.hasOffer,
    this.rating,
    this.ratingCount,
    this.size,
    this.brand,
    this.includes,
    this.howToUse,
    this.features,
    this.expiryDate,
    this.daysUntilExpiry,
    this.isExpired,
    this.stockQuantity,
    this.inStock,
    this.soldCount,
    this.isFeatured,
    this.isAvailable,
    this.availableDate,
    this.category,
    this.reviews,
    this.subcategory,
    this.createdAt,
    this.updatedAt,
    this.isFavorite,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imageUrl = json['image_url'];
    offerTitle = json['offer_title'];
    price = json['price']?.toDouble();
    discountPrice = json['discount_price']?.toDouble();
    finalPrice = json['final_price']?.toDouble();
    hasOffer = json['has_offer'];
    rating = json['rating']?.toDouble();
    ratingCount = json['rating_count'];
    size = json['size'];
    brand = json['brand'];
    includes = json['includes'];
    howToUse = json['how_to_use'];
    features = json['features'];
    expiryDate = json['expiry_date'];
    daysUntilExpiry = json['days_until_expiry'];
    isExpired = json['is_expired'];
    stockQuantity = json['stock_quantity'];
    inStock = json['in_stock'];
    soldCount = json['sold_count'];
    isFeatured = json['is_featured'];
    isAvailable = json['is_available'];
    availableDate = json['available_date'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;

    if (json['reviews'] != null) {
      reviews = json['reviews'];
    }

    subcategory = json['subcategory'] != null
        ? CategoryModel.fromJson(json['subcategory'])
        : null;

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFavorite = json['is_favorite'] == 1 || json['is_favorite'] == true;
  }
  ProductEntity toEntity() => ProductEntity(
        id: id ?? 0,
        title: title ?? '',
        slug: slug ?? '',
        description: description ?? '',
        imageUrl: imageUrl ?? '',
        offerTitle: offerTitle ?? '',
        price: price ?? 0.0,
        discountPrice: discountPrice ?? 0.0,
        finalPrice: finalPrice ?? 0.0,
        hasOffer: hasOffer ?? false,
        rating: rating ?? 0.0,
        ratingCount: ratingCount ?? 0,
        size: size ?? '',
        brand: brand ?? '',
        includes: includes ?? '',
        howToUse: howToUse ?? '',
        features: features ?? '',
        expiryDate: expiryDate ?? '',
        daysUntilExpiry: daysUntilExpiry ?? 0,
        isExpired: isExpired ?? false,
        stockQuantity: stockQuantity ?? 0,
        inStock: inStock ?? false,
        soldCount: soldCount ?? 0,
        isFeatured: isFeatured ?? false,
        isAvailable: isAvailable ?? false,
        availableDate: availableDate ?? '',
        isFavorite: isFavorite ?? false,
      );
}

class CategoryModel {
  int? id;
  String? name;
  String? slug;

  CategoryModel({this.id, this.name, this.slug});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }
  CategoryEntity toEntity() =>
      CategoryEntity(id: id ?? 0, name: name ?? '', slug: slug ?? '');
}
