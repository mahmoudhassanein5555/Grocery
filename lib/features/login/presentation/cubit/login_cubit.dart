import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/useCase/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    if (isClosed) return;
    emit(LoginLoading());
    final result = await loginUseCase.call(email: email, password: password);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(LoginError(failure.failuremessage));
      },
      (loginEntity) {
        if (!isClosed) emit(LoginSuccess(loginEntity));
      },
    );
  }
}
