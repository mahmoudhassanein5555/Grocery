import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';
import 'package:grocery1/features/product_details/domain/repository/product_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsUseCase {
  final ProductDetailsRepository _repository;
  ProductDetailsUseCase(this._repository);
  Future<Either<Failure, ProductDetailsResponseEntity>> invoke(int productId) =>
      _repository.getProductDetails(productId);
}
