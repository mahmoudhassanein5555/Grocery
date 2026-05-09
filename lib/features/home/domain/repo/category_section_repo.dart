import 'package:dartz/dartz.dart';
import 'package:grocery1/features/home/domain/entity/category_section_entity.dart';

import '../../../../core/failure/failure.dart';

abstract class CategorySectionRepo {
  Future<Either<Failure, List<CategorySectionEntity>>> getAllCategory();
}
