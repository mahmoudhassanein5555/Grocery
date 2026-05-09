import 'package:dartz/dartz.dart';
import 'package:grocery1/features/signup/domain/entities/register_response_entity.dart';
import 'package:grocery1/core/failure/failure.dart';

abstract class Registerremotedatasource {
  Future<Either<Failure, RegisterResponseEntity>> register(String email,
      String name, String password, String rePassword, String phone);
}
