import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure/failure.dart';
import '../entity/products_search_entity.dart';
import '../repo/product_search_repository.dart';

@injectable
class GetProductsSearchUseCase {
  final ProductRepository repository;

  GetProductsSearchUseCase(this.repository);

  Future<Either<Failure, ProductSearchEntity>> call({
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
  }) {
    return repository.getProducts(
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
  }
}
