import 'package:flutter/cupertino.dart';

import '../../domain/entity/login_entity.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginEntity loginEntity;

  LoginSuccess(this.loginEntity);
}

final class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}
