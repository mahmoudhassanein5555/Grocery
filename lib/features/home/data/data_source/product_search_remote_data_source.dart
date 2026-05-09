import '../model/product_search_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductSearchModel> getProducts({
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
  });
}
