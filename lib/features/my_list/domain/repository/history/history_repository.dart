import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<HistoryEntity>>> getHistory(
      {FilterModel? filters});
  Future<Either<Failure, FavoriteToggleDataEntity>> addRemoveFavorite(
    int mealId,
  );
}
