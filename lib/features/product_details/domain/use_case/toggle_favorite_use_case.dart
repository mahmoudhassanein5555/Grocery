import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';
import 'package:grocery1/features/product_details/domain/repository/product_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleFavoriteUseCase {
  final ProductDetailsRepository _repository;

  ToggleFavoriteUseCase(this._repository);

  Future<Either<Failure, FavoriteToggleEntity>> invoke(int productId) {
    return _repository.toggleFavorite(productId);
  }
}
