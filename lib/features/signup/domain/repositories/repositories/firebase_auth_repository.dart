import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery1/core/failure/failure.dart';

import 'package:grocery1/features/signup/domain/entities/register_response_entity.dart';

abstract class Firebaseauthrepository {
  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password);
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password);
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, UserCredential>> signInWithFacebook();
}
