import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/home/domain/entity/category_section_entity.dart';
import 'package:grocery1/features/home/domain/repo/category_section_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategorySectionUseCase {
  final CategorySectionRepo categorySectionRepo;

  CategorySectionUseCase(this.categorySectionRepo);

  Future<Either<Failure, List<CategorySectionEntity>>> call() {
    return categorySectionRepo.getAllCategory();
  }
}
