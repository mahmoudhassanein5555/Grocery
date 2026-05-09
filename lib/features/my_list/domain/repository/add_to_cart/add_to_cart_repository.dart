import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

abstract class AddToCartRepository {
  Future<Either<Failure, String>> addToCart(int mealId);
}
