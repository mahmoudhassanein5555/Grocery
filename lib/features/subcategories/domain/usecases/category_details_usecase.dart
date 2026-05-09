import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

import 'package:grocery1/features/subcategories/domain/entities/category_details_response_entity.dart';
import 'package:grocery1/features/subcategories/domain/repositories/repositories/category_details_repository.dart';

@injectable
class CategoryDetailsUseCase {
  final CategoryDetailsRepository categoryDetails;

  CategoryDetailsUseCase({required this.categoryDetails});

  Future<Either<Failure, CategoryDetailsResponseEntity>> invoke(int id) {
    return categoryDetails.getCategoryDetails(id);
  }
}
