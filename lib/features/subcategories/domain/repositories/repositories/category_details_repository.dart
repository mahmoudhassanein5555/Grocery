import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

import 'package:grocery1/features/subcategories/domain/entities/category_details_response_entity.dart';

abstract class CategoryDetailsRepository {
  Future<Either<Failure, CategoryDetailsResponseEntity>> getCategoryDetails(
      int id);
}
