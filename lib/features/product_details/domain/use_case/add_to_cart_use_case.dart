import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';
import 'package:grocery1/features/product_details/domain/repository/product_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final ProductDetailsRepository _repository;

  AddToCartUseCase(this._repository);

  Future<Either<Failure, AddToCartEntity>> invoke(int mealId, int quantity) {
    return _repository.addToCart(mealId, quantity);
  }
}
