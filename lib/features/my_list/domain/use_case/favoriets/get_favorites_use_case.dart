import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';
import 'package:grocery1/features/my_list/domain/repository/favorites/favorites_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoritesUseCase {
  final FavoritesRepository _repository;

  GetFavoritesUseCase(this._repository);

  Future<Either<Failure, List<FavoriteEntity>>> invoke() =>
      _repository.getFavorites();
}
