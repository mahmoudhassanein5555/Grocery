import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/home/data/data_source/recommended_meal_remote_data_source.dart';
import 'package:grocery1/features/home/data/model/recommended_meal_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error.dart';

@Injectable(as: RecommendedMealRemoteDataSource)
class RecommendedMealRemoteDataSourceImpl
    implements RecommendedMealRemoteDataSource {
  final ApiManager apiManager;

  RecommendedMealRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<RecommendedMealModel>> getRecommendedForYou() async {
    try {
      final response = await apiManager.getData(
        endPoint: ApiEndpoints.recommendationsEndpoint,
      );
      if (response.statusCode == 200) {
        final List data = response.data['data'];
        return data.map((item) => RecommendedMealModel.fromJson(item)).toList();
      }
      throw RemoteException(response.data['message']);
    } on RemoteException {
      rethrow;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
