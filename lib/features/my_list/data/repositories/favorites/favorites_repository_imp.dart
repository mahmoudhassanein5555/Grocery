import 'package:dartz/dartz.dart';
import 'package:grocery1/core/error/error_handler.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/data/datasources/favorites/favorites_data_source.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/domain/repository/favorites/favorites_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource _dataSource;

  FavoritesRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites() async {
    try {
      final models = await _dataSource.getFavorites();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, FavoriteToggleDataEntity>> removeFavorite(
    int mealId,
  ) async {
    try {
      final response = await _dataSource.removeFavorite(mealId);
      return Right(response.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
