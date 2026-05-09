// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:grocery1/core/failure/failure.dart';
// import 'package:grocery1/features/login/data/local/local_data_source.dart';
// import 'package:grocery1/features/login/data/model/login_model.dart';
// import 'package:injectable/injectable.dart';

// import '../../domain/entity/login_entity.dart';
// import '../../domain/repo/login_repo.dart';
// import '../data_Source/login_remote_data_source.dart';

// @Injectable(as: LoginRepo)
// class LoginRepoImpl implements LoginRepo {
//   final LoginRemoteDataSource loginRemoteDataSource;
//   final LocalauthDatasouce localauthDatasouce;
//   LoginRepoImpl(this.loginRemoteDataSource, {required this.localauthDatasouce});

//   @override
//   Future<Either<Failure, LoginEntity>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final result = await loginRemoteDataSource.login(
//         email: email,
//         password: password,
//       );
//       final res= result.map((model) => model.toEntity());

//       localauthDatasouce.saveToken(res);
//       return
//     } catch (e) {
//       return Left(Failure(e.toString()));
//     }
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/login/data/data_Source/login_remote_data_source.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import 'package:grocery1/features/login/domain/entity/login_entity.dart';
import 'package:grocery1/features/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LocalauthDatasouce localauthDatasouce;

  LoginRepoImpl(
    this.loginRemoteDataSource,
    this.localauthDatasouce,
  );

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await loginRemoteDataSource.login(
        email: email,
        password: password,
      );

      return result.fold(
        (failure) => Left(failure),
        (model) async {
          final entity = model.toEntity();

          // ✅ خزّن التوكن بس
          await localauthDatasouce.saveToken(entity.token);

          return Right(entity);
        },
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
