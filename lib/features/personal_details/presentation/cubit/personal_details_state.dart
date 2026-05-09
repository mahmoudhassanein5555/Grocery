import '../../domain/entities/profile_entity.dart';

abstract class PersonalDetailsState {}

class PersonalDetailsInitial extends PersonalDetailsState {}

class PersonalDetailsLoading extends PersonalDetailsState {}

class PersonalDetailsLoaded extends PersonalDetailsState {
  final ProfileEntity profile;
  PersonalDetailsLoaded({required this.profile});
}

class PersonalDetailsUpdateLoading extends PersonalDetailsState {}

class PersonalDetailsUpdateSuccess extends PersonalDetailsState {}

class PersonalDetailsError extends PersonalDetailsState {
  final String message;
  PersonalDetailsError({required this.message});
}
