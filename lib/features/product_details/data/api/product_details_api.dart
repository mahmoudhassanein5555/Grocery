import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_constant.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import 'package:grocery1/features/product_details/data/models/product_details_model.dart';
import 'package:grocery1/features/product_details/data/models/favorite_toggle_model.dart';
import 'package:grocery1/features/product_details/data/models/add_to_cart_model.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class ProductDetailsApi {
  final ApiManager _apiManager = ApiManager();
  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();
    if (token == null || token.isEmpty) {
      throw RemoteException('Authentication token not found');
    }
    return {'Authorization': 'Bearer $token'};
  }

  Future<ProductDetailsResponseModel> fetchProductDetails(int productId) async {
    try {
      final response = await _apiManager.getData(
        endPoint: '${ApiEndpoints.mealsEndpoint}/$productId',
        headers: await _authHeaders(),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          'Failed to load product details: ${response.statusCode}',
        );
      }
      var data = ProductDetailsResponseModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw RemoteException('Failed to load product details: $e');
    }
  }

  Future<FavoriteToggleModel> toggleFavorite(int productId) async {
    try {
      final response = await _apiManager.postData(
        endPoint:
            '${ApiEndpoints.favoritesEndpoint}/$productId/${ApiEndpoints.toggleFavoriteEndpoint}',
        headers: await _authHeaders(),
        body: {"meal_id": productId},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          'Failed to toggle favorite: ${response.statusCode}',
        );
      }
      return FavoriteToggleModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException('Failed to toggle favorite: $e');
    }
  }

  Future<AddToCartModel> addToCart(int mealId, int quantity) async {
    try {
      final response = await _apiManager.postData(
        endPoint: ApiEndpoints.cartItemsEndpoint,
        headers: await _authHeaders(),
        body: FormData.fromMap({"meal_id": mealId, "quantity": quantity}),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException('Failed to add to cart: ${response.statusCode}');
      }
      return AddToCartModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException("An unexpected error occurred");
    }
  }
}
