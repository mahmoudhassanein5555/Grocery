import 'package:dartz/dartz.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/product_details/data/data_source/product_details_data_source.dart';
import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';
import 'package:grocery1/features/product_details/domain/repository/product_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepository)
class ProductDetailsRepositoryImp implements ProductDetailsRepository {
  final ProductDetailsDataSource _productDetailsDataSource;
  ProductDetailsRepositoryImp(this._productDetailsDataSource);

  @override
  Future<Either<Failure, ProductDetailsResponseEntity>> getProductDetails(
    int productId,
  ) async {
    try {
      final result = await _productDetailsDataSource.getProductDetails(
        productId,
      );
      return Right(result);
    } on RemoteException catch (e) {
      return Left(Failure(e.errormessage));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, FavoriteToggleEntity>> toggleFavorite(
      int productId) async {
    try {
      final result = await _productDetailsDataSource.toggleFavorite(productId);
      return Right(result);
    } on RemoteException catch (e) {
      return Left(Failure(e.errormessage));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, AddToCartEntity>> addToCart(
      int mealId, int quantity) async {
    try {
      final result =
          await _productDetailsDataSource.addToCart(mealId, quantity);
      return Right(result);
    } on RemoteException catch (e) {
      return Left(Failure(e.errormessage));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }
}
