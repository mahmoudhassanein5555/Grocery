import 'package:grocery1/features/home/data/model/recommended_meal_model.dart';

abstract class RecommendedMealRemoteDataSource {
  Future<List<RecommendedMealModel>> getRecommendedForYou();
}
