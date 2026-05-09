import 'package:grocery1/features/product_details/data/api/product_details_api.dart';
import 'package:grocery1/features/product_details/data/data_source/product_details_data_source.dart';
import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsDataSource)
class ProductDetailsDataSourceImp extends ProductDetailsDataSource {
  final ProductDetailsApi _productDetailsApi;
  ProductDetailsDataSourceImp(this._productDetailsApi);
  @override
  Future<ProductDetailsResponseEntity> getProductDetails(int productId) async {
    final responseModel = await _productDetailsApi.fetchProductDetails(
      productId,
    );
    var responseEntity = responseModel.toEntity();
    return responseEntity;
  }

  @override
  Future<FavoriteToggleEntity> toggleFavorite(int productId) async {
    final responseModel = await _productDetailsApi.toggleFavorite(productId);
    return responseModel.toEntity();
  }

  @override
  Future<AddToCartEntity> addToCart(int mealId, int quantity) async {
    final responseModel = await _productDetailsApi.addToCart(mealId, quantity);
    return responseModel.toEntity();
  }
}
