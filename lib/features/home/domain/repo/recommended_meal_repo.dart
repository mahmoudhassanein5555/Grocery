import 'package:dartz/dartz.dart';
import 'package:grocery1/features/home/domain/entity/recommended_meal_entity.dart';

import '../../../../core/failure/failure.dart';

abstract class RecommendedMealRepo {
  Future<Either<Failure, List<RecommendedMealEntity>>> getRecommendedForYou();
}
