import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsResponseEntity>> getProductDetails(
    int productId,
  );
  Future<Either<Failure, FavoriteToggleEntity>> toggleFavorite(int productId);
  Future<Either<Failure, AddToCartEntity>> addToCart(int mealId, int quantity);
}
