import 'dart:isolate';

import 'package:grocery1/core/failure/failure.dart';

import '../../../../domain/entities/register_response_entity.dart';

abstract class RegisterStates {}

class RegisterInitState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final Map<String, List<String>> errors;

  RegisterErrorState({required this.errors});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity responseEntity;
  RegisterSuccessState({required this.responseEntity});
}

class TermsChanged extends RegisterStates {}
