import 'package:dartz/dartz.dart';
import 'package:grocery1/core/error/error_handler.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/data/datasources/history/history_data_source.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';
import 'package:grocery1/features/my_list/domain/repository/history/history_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDataSource _dataSource;

  HistoryRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<HistoryEntity>>> getHistory({
    FilterModel? filters,
  }) async {
    try {
      final models = await _dataSource.getHistory(filters: filters);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, FavoriteToggleDataEntity>> addRemoveFavorite(
    int mealId,
  ) async {
    try {
      final result = await _dataSource.addRemoveFavorite(mealId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
