import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

import 'package:injectable/injectable.dart';

import 'package:grocery1/features/subcategories/domain/repositories/repositories/categories_repository.dart';

import 'package:grocery1/features/subcategories/domain/entities/categories_response_entity.dart';

@injectable
class CategoriesUseCase {
  Categoriesrepository categoriesrepository;
  CategoriesUseCase({required this.categoriesrepository});
  Future<Either<Failure, CategoriesResponseEntity>> invoke() {
    return categoriesrepository.getAllCategory();
  }
}
