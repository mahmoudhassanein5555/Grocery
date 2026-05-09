import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/firebase_auth_usecase.dart';
import 'firebase_auth_state.dart';

@injectable
class FirebaseauthViewModel extends Cubit<Firebaseauthstate> {
  final AuthUseCases authUseCases;

  FirebaseauthViewModel({required this.authUseCases}) : super(AuthInitial());

  // ================= GOOGLE =================

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final result = await authUseCases.google();
    result.fold(
      (failure) => emit(AuthError(failure.failuremessage)),
      (user) => emit(AuthSuccess()),
    );
  }

  // ================= EMAIL LOGIN =================
  Future<void> signInWithEmail(String email, String password) async {
    // emit(AuthLoading());
    //
    // final result = await authUseCases.email(email, password);
    //
    // result.fold(
    //       (failure) => emit(AuthError(failure.failuremessage)),
    //       (user) => emit(AuthSuccess(user)),
    // );
  }

  // ================= FACEBOOK =================
  Future<void> signInWithFacebook() async {
    emit(AuthLoading());

    final result = await authUseCases.facebook();

    result.fold(
      (failure) => emit(AuthError(failure.failuremessage)),
      (user) => emit(AuthSuccess()),
    );
  }
}
