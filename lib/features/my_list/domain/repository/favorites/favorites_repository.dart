import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites();
  Future<Either<Failure, FavoriteToggleDataEntity>> removeFavorite(int mealId);
}
