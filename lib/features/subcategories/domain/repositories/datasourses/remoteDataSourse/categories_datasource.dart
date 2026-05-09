import 'package:dartz/dartz.dart';

import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/subcategories/domain/entities/categories_response_entity.dart';

abstract class CategoriesDataSource {
  Future<Either<Failure, CategoriesResponseEntity>> getAllCategory();
}
