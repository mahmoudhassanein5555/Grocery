import '../model/meal_model.dart';

abstract class MealsRemoteDataSource {
  Future<List<MealModel>> getTodayDeals();
}
