import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/cart/data/models/data.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import '../datasource/cart_datasource.dart';

// class CartRepositoryImpl {
//   final CartDatasource datasource =CartDatasource();

//   Future<Either<Failure, Data_>> getCart() async {
//     try {
//       final result = await datasource.getCartProducts();
//       if(result.success == false || result.data == null) {
//         throw RemoteException(result.message ?? "Failed to fetch cart data");
//       }
//       return Right(result.data!);
//     } on RemoteException catch (e) {
//       return Left(Failure('e.toString()'));
//     }
//   }
// }

class CartRepositoryImpl {
  final CartDatasource datasource = CartDatasource();

  Future<Either<Failure, Data_>> getCart() async {
    try {
      final result = await datasource.getCartProducts();

      if (result.success == false || result.data == null) {
        return Left(Failure(result.message ?? "Failed to fetch cart data"));
      }

      return Right(result.data!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();
  ApiManager apiManager = ApiManager();
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

  Future<void> deleteItem(int id) async {
    await apiManager.deleteData(
      endPoint: '/api/cart/items/$id',
      options: Options(headers: await _authHeaders()),
    );
  }

  Future<int> createOrder(Map<String, dynamic> orderData) async {
    try {
      final response = await apiManager.postData(
        endPoint: '/api/orders',
        body: orderData,
        options: Options(headers: await _authHeaders()),
      );

      if (response.statusCode == 201) {
       return response.data['data']['id'];
      } else {
        throw RemoteException('Failed to create order');
      }
    } catch (e) {
      print("🔥 DIO ERROR: $e");
      throw RemoteException("Failed to create order try again}");
    }
  }

    Future<String> createCheckout(Map<String, dynamic> data) async {
  final response = await apiManager.postData(
      options: Options(headers: await _authHeaders()),
    endPoint: '/api/payments/stripe/checkout-session',
    body: data,
  );

  return response.data["data"]["checkout_url"];
}
}
