import 'category.dart';
import 'subcategory.dart';

class Meal_ {
  int id;
  String? title;
  String? slug;
  String? imageUrl;
  double? price;
  double? discountPrice;
  double? finalPrice;
  double? rating;
  String? size;
  String? brand;
  int? stockQuantity;
  bool? isAvailable;
  bool? inStock;
  Category_? category;
  Subcategory? subcategory;

  Meal_({
  required this.id,
    
    this.title,
    this.slug,
    this.imageUrl,
    this.price,
    this.discountPrice,
    this.finalPrice,
    this.rating,
    this.size,
    this.brand,
    this.stockQuantity,
    this.isAvailable,
    this.inStock,
    this.category,
    this.subcategory,
  });

  factory Meal_.fromJson(Map<String, dynamic> json) => Meal_(
        id: json['id'] as int,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        imageUrl: json['image_url'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        discountPrice: json['discount_price'] as double? ,
        finalPrice: (json['final_price'] as num?)?.toDouble(),
        rating: (json['rating'] as num?)?.toDouble(),
        size: json['size'] as String?,
        brand: json['brand'] as String?,
        stockQuantity: json['stock_quantity'] as int?,
        isAvailable: json['is_available'] as bool?,
        inStock: json['in_stock'] as bool?,
        category: json['category'] == null
            ? null
            : Category_.fromJson(json['category'] as Map<String, dynamic>),
        subcategory: json['subcategory'] == null
            ? null
            : Subcategory.fromJson(json['subcategory'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'image_url': imageUrl,
        'price': price,
        'discount_price': discountPrice,
        'final_price': finalPrice,
        'rating': rating,
        'size': size,
        'brand': brand,
        'stock_quantity': stockQuantity,
        'is_available': isAvailable,
        'in_stock': inStock,
        'category': category?.toJson(),
        'subcategory': subcategory?.toJson(),
      };
}
