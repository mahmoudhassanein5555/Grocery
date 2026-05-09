import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

import 'package:grocery1/features/subcategories/domain/repositories/datasourses/remoteDataSourse/categories_datasource.dart';

import 'package:grocery1/features/subcategories/domain/entities/categories_response_entity.dart';

import 'package:grocery1/features/subcategories/data/models/categories_response_dm.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl implements CategoriesDataSource {
  ApiManager apiManger;

  CategoriesDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, CategoriesResponseEntity>> getAllCategory() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.wifi) &&
          !connectivityResult.contains(ConnectivityResult.mobile)) {
        return Left(Failure('No Internet Connection'));
      }

      final response = await apiManger.getData(
        endPoint: ApiEndpoints.cateEndpoint,
      );

      final getAllCategoriesResponse =
          CategoriesResponseDm.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(getAllCategoriesResponse);
      }

      return Left(
        Failure(getAllCategoriesResponse.message ?? 'Something went wrong'),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
