import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/home/data/data_source/category_section_remote_data_source.dart';
import 'package:grocery1/features/home/domain/entity/category_section_entity.dart';
import 'package:grocery1/features/home/domain/repo/category_section_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error.dart';

@Injectable(as: CategorySectionRepo)
class CategorySectionRepoImpl implements CategorySectionRepo {
  final CategorySectionRemoteDataSource categorySectionRemoteDataSource;

  CategorySectionRepoImpl(this.categorySectionRemoteDataSource);

  @override
  Future<Either<Failure, List<CategorySectionEntity>>> getAllCategory() async {
    try {
      final models = await categorySectionRemoteDataSource.getAllCategory();
      final entities = models.map((e) => e.toEntity()).toList();
      return Right(entities);
    } on RemoteException catch (e) {
      return Left(Failure(e.errormessage));
    }
  }
}
