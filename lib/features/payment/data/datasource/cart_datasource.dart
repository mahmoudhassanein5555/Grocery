import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/features/cart/data/models/cartresponse.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';

class CartDatasource {
  final ApiManager apiManger = ApiManager();

  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();

    if (token == null || token.isEmpty) {
      throw RemoteException('Authentication token not found');
    }

    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
  }

  Future<Cartresponse_> getCartProducts() async {
    try {
      final response = await apiManger.getData(
        endPoint: '/api/cart',
        options: Options(headers: await _authHeaders()),
      );

      return Cartresponse_.fromJson(response.data);
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
