import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';

import '../entity/meal_entity.dart';

abstract class MealRepository {
  Future<Either<Failure, List<MealEntity>>> getTodayDeals();
}
