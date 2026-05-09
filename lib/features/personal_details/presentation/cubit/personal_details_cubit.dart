import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/personal_details/presentation/cubit/personal_details_state.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/personal_details_repo.dart';

class PersonalDetailsCubit extends Cubit<PersonalDetailsState> {
  final PersonalDetailsRepo repo;

  PersonalDetailsCubit({required this.repo}) : super(PersonalDetailsInitial());

  Future<void> getProfile() async {
    if (isClosed) return;
    emit(PersonalDetailsLoading());
    final result = await repo.getProfile();
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed)
          emit(PersonalDetailsError(message: failure.failuremessage));
      },
      (profile) {
        if (!isClosed) emit(PersonalDetailsLoaded(profile: profile));
      },
    );
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    if (isClosed) return;
    emit(PersonalDetailsUpdateLoading());
    final result = await repo.updateProfile(profile);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed)
          emit(PersonalDetailsError(message: failure.failuremessage));
      },
      (_) {
        if (!isClosed) emit(PersonalDetailsUpdateSuccess());
      },
    );
  }
}
