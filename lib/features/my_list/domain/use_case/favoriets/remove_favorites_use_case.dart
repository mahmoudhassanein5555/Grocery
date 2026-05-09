import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/domain/repository/favorites/favorites_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAndRemoveFavoriteUseCase {
  final FavoritesRepository _favoritesRepository;

  AddAndRemoveFavoriteUseCase(this._favoritesRepository);
  Future<Either<Failure, FavoriteToggleDataEntity>> invoke(int mealId) =>
      _favoritesRepository.removeFavorite(mealId);
}
