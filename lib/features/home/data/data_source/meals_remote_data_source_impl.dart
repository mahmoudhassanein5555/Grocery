import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/home/data/data_source/meals_remote_data_source.dart';
import 'package:grocery1/features/home/data/model/meal_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error.dart';

@Injectable(as: MealsRemoteDataSource)
class MealsRemoteDataSourceImpl implements MealsRemoteDataSource {
  final ApiManager apiManager;

  MealsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<MealModel>> getTodayDeals() async {
    try {
      final response = await apiManager.getData(
        endPoint: ApiEndpoints.todayMealsEndpoint,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List model = response.data['data'] ?? response.data ?? [];
        return model.map((item) => MealModel.fromJson(item)).toList();
      }

      throw RemoteException(response.data['message']);
    } on RemoteException {
      rethrow;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
