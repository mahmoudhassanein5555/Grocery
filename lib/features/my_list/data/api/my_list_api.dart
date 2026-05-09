import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import 'package:grocery1/features/my_list/data/models/favorite_model.dart';
import 'package:grocery1/features/my_list/data/models/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/data/models/history_model.dart';
import 'package:grocery1/features/my_list/data/models/smart_list_model.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class MyListApi {
  final ApiManager _apiManager = ApiManager();
  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();
    if (token == null || token.isEmpty) {
      throw RemoteException('Authentication token not found');
    }
    return {'Authorization': 'Bearer $token'};
  }

  Future<SmartListResponseModel> fetchSmartLists() async {
    try {
      final response = await _apiManager.getData(
        endPoint: ApiEndpoints.smartListsEndpoint,
        headers: await _authHeaders(),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return SmartListResponseModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  Future<FavoriteResponseModel> fetchFavorites() async {
    try {
      final response = await _apiManager.getData(
        endPoint: ApiEndpoints.favoritesEndpoint,
        headers: await _authHeaders(),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return FavoriteResponseModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException('$e');
    }
  }

  Future<HistoryResponseModel> fetchHistory({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _apiManager.getData(
        endPoint: ApiEndpoints.historyEndpoint,
        queryParameters: queryParameters,
        headers: await _authHeaders(),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return HistoryResponseModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException('$e');
    }
  }

  Future<String> deleteSmartList(int id) async {
    try {
      final response = await _apiManager.deleteData(
        endPoint: "${ApiEndpoints.smartListsEndpoint}/$id",
        headers: await _authHeaders(),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return response.statusMessage ?? 'Success';
    } catch (e) {
      throw RemoteException('$e');
    }
  }

  Future<String> addToCart({required int mealId, required int quantity}) async {
    try {
      var response = await _apiManager.postData(
        endPoint: ApiEndpoints.cartItemsEndpoint,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...await _authHeaders(),
        },
        body: {"meal_id": mealId.toString(), "quantity": quantity.toString()},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return response.statusMessage ?? 'Success';
    } catch (e) {
      if (e is DioException && e.response != null) {
        final errorMessage =
            e.response?.data['message'] ?? "Something went wrong";
        throw RemoteException(errorMessage);
      }
      throw RemoteException('$e');
    }
  }

  Future<FavoriteToggleDataModel> removeFavorite(int mealId) async {
    try {
      var response = await _apiManager.postData(
        endPoint:
            "${ApiEndpoints.favoritesEndpoint}/$mealId/${ApiEndpoints.toggleFavoriteEndpoint}",
        headers: await _authHeaders(),
        // body: {"meal_id": mealId},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return FavoriteToggleDataModel.fromJson(response.data);
    } catch (e, stack) {
      print("🔥 DIO ERROR: $e");

      print("📌 STACK: $stack");

      if (e is DioException) {
        print("🔥 RESPONSE: ${e.response?.data}");
      }

      throw RemoteException(
        e is DioException
            ? (e.response?.data?["message"]?.toString() ?? "Dio error")
            : e.toString(),
      );
    }
  }
}
