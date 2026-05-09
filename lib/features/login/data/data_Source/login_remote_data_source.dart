import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

import '../model/login_model.dart';

abstract class LoginRemoteDataSource {
  // login model
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });
}
