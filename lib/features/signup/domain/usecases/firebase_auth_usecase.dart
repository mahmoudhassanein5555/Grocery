import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';
import '../entities/register_response_entity.dart';
import '../repositories/repositories/firebase_auth_repository.dart';

@injectable
class AuthUseCases {
  final SignInWithGoogleUseCase google;
  final SignInWithEmailUseCase email;
  final SignUpWithEmailUseCase signUp;
  final SignInWithFacebookUseCase facebook;

  AuthUseCases({
    required this.google,
    required this.email,
    required this.signUp,
    required this.facebook,
  });
}

@injectable
class SignInWithGoogleUseCase {
  final Firebaseauthrepository repository;

  SignInWithGoogleUseCase(this.repository);

  Future<Either<Failure, UserCredential>> call() {
    return repository.signInWithGoogle();
  }
}

@injectable
class SignInWithEmailUseCase {
  final Firebaseauthrepository repository;

  SignInWithEmailUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}

@injectable
class SignUpWithEmailUseCase {
  final Firebaseauthrepository repository;

  SignUpWithEmailUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return repository.signUpWithEmail(email, password);
  }
}

@injectable
class SignInWithFacebookUseCase {
  final Firebaseauthrepository repository;

  SignInWithFacebookUseCase(this.repository);

  Future<Either<Failure, UserCredential>> call() {
    return repository.signInWithFacebook();
  }
}
