import 'package:dartz/dartz.dart';
import 'package:grocery1/features/signup/domain/entities/register_response_entity.dart';
import 'package:grocery1/features/signup/domain/repositories/datasourses/remoteDataSourse/register_remote_datasource.dart';
import 'package:grocery1/features/signup/domain/repositories/repositories/register_repository.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepository)
class Registerrepositoryimpl implements RegisterRepository {
  Registerremotedatasource registerremotedatasource;
  Registerrepositoryimpl({required this.registerremotedatasource});
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await registerremotedatasource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
