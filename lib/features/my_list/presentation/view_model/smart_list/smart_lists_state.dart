import 'package:equatable/equatable.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';

abstract class SmartListsState extends Equatable {
  const SmartListsState();

  @override
  List<Object> get props => [];
}

class SmartListsInitial extends SmartListsState {}

class SmartListsLoading extends SmartListsState {}

class SmartListsLoaded extends SmartListsState {
  final List<SmartListEntity> smartLists;

  const SmartListsLoaded(this.smartLists);

  @override
  List<Object> get props => [smartLists];
}

class SmartListsError extends SmartListsState {
  final String message;

  const SmartListsError(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteSmartListSuccess extends SmartListsState {
  final String message;
  const DeleteSmartListSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteSmartListError extends SmartListsState {
  final String message;
  const DeleteSmartListError(this.message);

  @override
  List<Object> get props => [message];
}

class AddAllToCartSuccess extends SmartListsState {
  final String message;
  const AddAllToCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AddAllToCartError extends SmartListsState {
  final String message;
  const AddAllToCartError(this.message);

  @override
  List<Object> get props => [message];
}
//
