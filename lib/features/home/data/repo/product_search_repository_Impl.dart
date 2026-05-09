import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/products_search_entity.dart';
import '../../domain/repo/product_search_repository.dart';
import '../data_source/product_search_remote_data_source.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
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
  }) async {
    try {
      final result = await remoteDataSource.getProducts(
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
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
