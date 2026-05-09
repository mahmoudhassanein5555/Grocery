import '../../../../domain/entities/register_response_entity.dart';

abstract class Firebaseauthstate {}

class AuthInitial extends Firebaseauthstate {}

class AuthLoading extends Firebaseauthstate {}

class AuthSuccess extends Firebaseauthstate {}

class AuthError extends Firebaseauthstate {
  final String message;
  AuthError(this.message);
}
