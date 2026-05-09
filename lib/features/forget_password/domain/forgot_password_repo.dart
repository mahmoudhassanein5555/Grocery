import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, void>> sendCode({String? email, String? phone});
  Future<Either<Failure, void>> resetPassword(String newPassword);
  Future<Either<Failure, void>> verifyOtp(String otp);
}
