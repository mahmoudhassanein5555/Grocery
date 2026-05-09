import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/repository/add_to_cart/add_to_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartSmartListUseCase {
  final AddToCartRepository _addToCartRepository;

  AddToCartSmartListUseCase(this._addToCartRepository);
  Future<Either<Failure, String>> invoke(int mealId) =>
      _addToCartRepository.addToCart(mealId);
}
