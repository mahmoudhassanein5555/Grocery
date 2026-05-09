import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

import '../entities/register_response_entity.dart';
import '../repositories/repositories/register_repository.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  Future<Either<Failure, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) {
    return registerRepository.register(
        name, email, password, rePassword, phone);
  }
}
