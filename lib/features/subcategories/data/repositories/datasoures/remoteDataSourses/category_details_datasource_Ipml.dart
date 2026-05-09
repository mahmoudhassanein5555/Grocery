import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery1/features/subcategories/domain/repositories/datasourses/remoteDataSourse/category_details_datasource.dart';

import 'package:grocery1/features/subcategories/domain/entities/category_details_response_entity.dart';

import 'package:grocery1/features/subcategories/data/models/category_details_response_dm.dart';

@Injectable(as: CategoryDetailsDatasource)
class CategoryDetailsDataSourceImpl implements CategoryDetailsDatasource {
  final ApiManager apiManger;

  CategoryDetailsDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, CategoryDetailsResponseEntity>> getCategoryDetails(
      int id) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.wifi) &&
          !connectivityResult.contains(ConnectivityResult.mobile)) {
        return Left(Failure('No Internet Connection'));
      }

      final response = await apiManger.getData(
          endPoint: ApiEndpoints.categoryDetailsEndpoint(id));

      final categoryDetailsResponse =
          CategoryDetailsResponseDm.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(categoryDetailsResponse);
      }

      return Left(
        Failure(categoryDetailsResponse.message ?? 'Something went wrong'),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
