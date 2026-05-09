import 'package:dartz/dartz.dart';
import 'package:grocery1/core/error/error_handler.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/data/datasources/add_to_cart/add_to_cart_data_source.dart';
import 'package:grocery1/features/my_list/domain/repository/add_to_cart/add_to_cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepository)
class AddToCartRepositoryImp extends AddToCartRepository {
  final AddToCartDataSource _dataSource;

  AddToCartRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, String>> addToCart(int mealId) async {
    try {
      final response = await _dataSource.addToCart(mealId);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
