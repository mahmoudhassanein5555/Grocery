import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/domain/repository/history/history_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddRemoveFavoritesUseCase {
  final HistoryRepository _repository;

  AddRemoveFavoritesUseCase(this._repository);

  Future<Either<Failure, FavoriteToggleDataEntity>> invoke(int mealId) async {
    return await _repository.addRemoveFavorite(mealId);
  }
}
