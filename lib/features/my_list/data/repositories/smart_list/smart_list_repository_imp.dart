import 'package:dartz/dartz.dart';
import 'package:grocery1/core/error/error_handler.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/data/datasources/smart_list/smart_list_data_source_imp.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';
import 'package:grocery1/features/my_list/domain/repository/smart_list/smart_list_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartListRepository)
class SmartListRepositoryImpl implements SmartListRepository {
  final SmartListDataSource _dataSource;

  SmartListRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<SmartListEntity>>> getSmartLists() async {
    try {
      final models = await _dataSource.getSmartLists();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSmartList(int id) async {
    try {
      final result = await _dataSource.deleteSmartList(id);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> addAllToCart({
    required int mealId,
    required int quantity,
  }) async {
    try {
      final result = await _dataSource.addAllToCart(
        mealId: mealId,
        quantity: quantity,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
