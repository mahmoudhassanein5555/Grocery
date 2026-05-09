import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/cart/data/models/data.dart';
import 'package:grocery1/features/cart/data/repositories/cart_repository.dart';

class GetcartUsecase {
  CartRepositoryImpl repository = CartRepositoryImpl();

  Future<Either<Failure, Data_>> call() async {
    return await repository.getCart();
  }
}
class DeleteCartItemUseCase {
  final CartRepositoryImpl repository = CartRepositoryImpl();

  Future<void> call(int id) async {
    await repository.deleteItem(id);
  }
}
class CreateOrderUseCase {
  final CartRepositoryImpl repository = CartRepositoryImpl();

  Future<int> call(Map<String, dynamic> orderData) async {
    return await repository.createOrder(orderData);
  }
}

