import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:grocery1/core/failure/failure.dart';

import '../../domain/forgot_password_repo.dart';
import 'forgot_password_state.dart';
import 'package:grocery1/core/failure/failure.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo repo;
  ForgotPasswordCubit(this.repo) : super(ForgotPasswordInitial());

  bool isEmail = true;

  void toggleMethod(bool email) {
    isEmail = email;
    emit(ForgotPasswordInitial());
  }

  Future<void> sendCode({String? email, String? phone}) async {
    if (isClosed) return;
    emit(ForgotPasswordLoading());
    final result = await repo.sendCode(email: email, phone: phone);
    if (isClosed) return;
    result.fold(
      (failure) {
        print('❌ Failure: ${failure.failuremessage}');
        if (!isClosed) emit(ForgotPasswordError(failure.failuremessage));
      },
      (_) {
        print('✅ Success');
        if (!isClosed) emit(ForgotPasswordSuccess());
      },
    );
  }

  Future<void> resendCode({String? email, String? phone}) async {
    if (isClosed) return;
    emit(ForgotPasswordLoading());
    final result = await repo.sendCode(email: email, phone: phone);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(ForgotPasswordError(failure.failuremessage));
      },
      (_) {
        if (!isClosed) emit(ForgotPasswordCodeSent());
      },
    );
  }

  Future<void> verifyOtp(String otp) async {
    if (isClosed) return;
    emit(ForgotPasswordLoading());
    final result = await repo.verifyOtp(otp);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(ForgotPasswordError(failure.failuremessage));
      },
      (_) {
        if (!isClosed) emit(ForgotPasswordSuccess());
      },
    );
  }

  Future<void> resetPassword(String newPassword) async {
    if (isClosed) return;
    emit(ForgotPasswordLoading());
    final result = await repo.resetPassword(newPassword);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(ForgotPasswordError(failure.failuremessage));
      },
      (_) {
        if (!isClosed) emit(ForgotPasswordSuccess());
      },
    );
  }
}
