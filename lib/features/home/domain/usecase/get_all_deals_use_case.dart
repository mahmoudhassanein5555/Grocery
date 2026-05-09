import 'package:dartz/dartz.dart';
import 'package:grocery1/features/home/domain/entity/meal_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure/failure.dart';
// import '../entity/deal_entity.dart';
import '../repo/meals_repository.dart';

@injectable
class GetAllDealsUseCase {
  final MealRepository mealRepository;

  GetAllDealsUseCase(this.mealRepository);

  Future<Either<Failure, List<MealEntity>>> call() {
    return mealRepository.getTodayDeals();
  }
}
