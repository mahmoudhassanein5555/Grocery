import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

import '../entity/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
