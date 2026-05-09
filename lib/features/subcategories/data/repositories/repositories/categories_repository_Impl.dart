import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery1/features/subcategories/domain/entities/categories_response_entity.dart';
import 'package:grocery1/features/subcategories/domain/repositories/datasourses/remoteDataSourse/categories_datasource.dart'
    show CategoriesDataSource;
import 'package:grocery1/features/subcategories/domain/repositories/repositories/categories_repository.dart';

@Injectable(as: Categoriesrepository)
class CategoriesRepositoryImpl implements Categoriesrepository {
  CategoriesDataSource dataSource;
  CategoriesRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, CategoriesResponseEntity>> getAllCategory() async {
    var either = await dataSource.getAllCategory();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
