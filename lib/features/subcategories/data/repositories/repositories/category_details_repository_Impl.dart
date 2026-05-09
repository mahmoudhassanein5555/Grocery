import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

import 'package:injectable/injectable.dart';

import 'package:grocery1/features/subcategories/domain/entities/category_details_response_entity.dart';
import 'package:grocery1/features/subcategories/domain/repositories/datasourses/remoteDataSourse/category_details_datasource.dart';
import 'package:grocery1/features/subcategories/domain/repositories/repositories/category_details_repository.dart';

@Injectable(as: CategoryDetailsRepository)
class Categorydetailsrepositoryimpl extends CategoryDetailsRepository {
  CategoryDetailsDatasource datasource;
  Categorydetailsrepositoryimpl({required this.datasource});
  @override
  Future<Either<Failure, CategoryDetailsResponseEntity>> getCategoryDetails(
      int id) async {
    return datasource.getCategoryDetails(id);
  }
}
