import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

import '../entity/login_entity.dart';
import '../repo/login_repo.dart';

@injectable
class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
  }) {
    return loginRepo.login(email: email, password: password);
  }
}
