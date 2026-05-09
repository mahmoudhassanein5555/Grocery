import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/products_search_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductSearchEntity>> getProducts({
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
