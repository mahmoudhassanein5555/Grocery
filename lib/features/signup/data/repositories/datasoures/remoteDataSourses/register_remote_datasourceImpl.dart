import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery1/features/signup/data/models/register_response_dm.dart';
import 'package:grocery1/features/signup/domain/repositories/datasourses/remoteDataSourse/register_remote_datasource.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Registerremotedatasource)
class Registerremotedatasourceimpl implements Registerremotedatasource {
  final ApiManager apiManger;

  Registerremotedatasourceimpl({required this.apiManger});

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.wifi) &&
          !connectivityResult.contains(ConnectivityResult.mobile)) {
        return Left(Failure('No Internet Connection'));
      }
      final response = await apiManger.postData(
        endPoint: ApiEndpoints.registerEndpoint,
        body: {
          "email": email,
          "username": name,
          "phone": phone,
          "password": password,
          "password_confirmation": rePassword,
          "agree_terms": 1
        },
      );
      final registerResponse = RegisterResponseModel.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(registerResponse);
      }

      return Left(
        Failure(registerResponse.message ?? 'Something went wrong'),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
