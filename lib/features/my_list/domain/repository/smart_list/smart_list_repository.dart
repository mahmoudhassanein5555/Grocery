import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';

abstract class SmartListRepository {
  Future<Either<Failure, List<SmartListEntity>>> getSmartLists();
  Future<Either<Failure, String>> deleteSmartList(int id);
  Future<Either<Failure, String>> addAllToCart({
    required int mealId,
    required int quantity,
  });
}
