import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/signup/presentation/ui/auth/cubit/register_states.dart';
import 'package:injectable/injectable.dart';

import 'package:grocery1/features/signup/domain/usecases/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitState());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isAcceptedTerms = false;

  void toggleTerms(bool value) {
    isAcceptedTerms = value;
    emit(TermsChanged());
  }

  void register() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    if (!isAcceptedTerms) {
      emit(RegisterErrorState(
        errors: {
          "agree_terms": ["You must accept terms and conditions"]
        },
      ));
      return;
    }

    emit(RegisterLoadingState());

    final result = await registerUseCase.invoke(
      fullNameController.text,
      mailController.text,
      passwordController.text,
      rePasswordController.text,
      phoneController.text,
    );

    result.fold(
      (failure) {
        print("RAW ERROR: ${failure.failuremessage}");

        emit(RegisterErrorState(
          errors: {
            "general": [failure.failuremessage]
          },
        ));
      },
      (response) {
        emit(RegisterSuccessState(responseEntity: response));
      },
    );
  }
}
