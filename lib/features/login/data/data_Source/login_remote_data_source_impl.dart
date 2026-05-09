import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

import '../model/login_model.dart';
import '../model/request_login_model.dart';
import 'login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = RequestLoginModel(email: email, password: password);

      final response = await ApiManager().postData(
        endPoint: ApiEndpoints.loginEndpoint,
        body: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data as Map<String, dynamic>;
        final model = LoginModel.fromJson(responseData);

        // ✅ save token
        await _storage.write(
          key: 'token',
          value: model.data.token,
        );

        print(model.data.token);
        print(
            "***************************************************************");

        return Right(model);
      } else {
        return Left(Failure("Error happened"));
      }
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

  // ✅ هنا بقى getToken
  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }
}
