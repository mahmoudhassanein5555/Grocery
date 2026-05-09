import 'package:equatable/equatable.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FavoriteEntity> favorites;

  const FavoritesLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}

class RemoveFavoriteSuccess extends FavoritesState {
  final FavoriteToggleDataEntity data;
  const RemoveFavoriteSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class RemoveFavoriteError extends FavoritesState {
  final String message;
  const RemoveFavoriteError(this.message);
  @override
  List<Object> get props => [message];
}

class AddToCartDone extends FavoritesState {
  final String message;

  const AddToCartDone(this.message);

  @override
  List<Object> get props => [message];
}

class AddToCartFavoriteError extends FavoritesState {
  final String message;

  const AddToCartFavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
