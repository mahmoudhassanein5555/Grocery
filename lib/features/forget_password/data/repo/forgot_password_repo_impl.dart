import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';

import 'package:grocery1/core/failure/failure.dart';

import '../../../../core/api/api_constant.dart';
import '../../domain/forgot_password_repo.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    followRedirects: true,
    validateStatus: (status) => status! < 500,
  ));

  @override
  Future<Either<Failure, void>> sendCode({String? email, String? phone}) async {
    try {
      await dio.post(
        ApiEndpoints.forgotPasswordEndPoint,
        data: {
          if (email != null) 'email': email,
          if (phone != null) 'phone': phone,
        },
      );
      return Right(null);
    } catch (e) {
      print('❌ Error: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String otp) async {
    try {
      await dio.post(
        ApiEndpoints.verifyOtpEndPoint,
        data: {'otp': otp},
      );
      return Right(null);
    } catch (e) {
      print('❌ verifyOtp Error: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String newPassword) async {
    try {
      await dio.post(
        ApiEndpoints.resetPasswordEndPoint,
        data: {'newPassword': newPassword},
      );
      return Right(null);
    } catch (e) {
      print('❌ resetPassword Error: $e');
      return Left(Failure(e.toString()));
    }
  }
}
