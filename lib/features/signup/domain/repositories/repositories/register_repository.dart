import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import '../../entities/register_response_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponseEntity>> register(String email,
      String name, String password, String rePassword, String phone);
}
