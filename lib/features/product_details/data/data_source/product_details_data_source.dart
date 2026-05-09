import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';

abstract class ProductDetailsDataSource {
  Future<ProductDetailsResponseEntity> getProductDetails(int productId);
  Future<FavoriteToggleEntity> toggleFavorite(int productId);
  Future<AddToCartEntity> addToCart(int mealId, int quantity);
}
