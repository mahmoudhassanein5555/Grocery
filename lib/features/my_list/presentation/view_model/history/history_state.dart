import 'package:equatable/equatable.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<HistoryEntity> historyItems;

  const HistoryLoaded(this.historyItems);

  @override
  List<Object> get props => [historyItems];
}

class HistoryError extends HistoryState {
  final String message;

  const HistoryError(this.message);

  @override
  List<Object> get props => [message];
}

class AddRemoveFavoriteSuccess extends HistoryState {
  final FavoriteToggleDataEntity response;

  const AddRemoveFavoriteSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class AddToCartSuccess extends HistoryState {
  final String message;

  const AddToCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AddToCartHistoryError extends HistoryState {
  final String message;

  const AddToCartHistoryError(this.message);

  @override
  List<Object> get props => [message];
}
