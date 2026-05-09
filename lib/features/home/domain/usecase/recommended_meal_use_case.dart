import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/home/domain/entity/recommended_meal_entity.dart';
import 'package:grocery1/features/home/domain/repo/recommended_meal_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecommendedMealUseCase {
  final RecommendedMealRepo recommendedMealRepo;

  RecommendedMealUseCase(this.recommendedMealRepo);

  Future<Either<Failure, List<RecommendedMealEntity>>> call() {
    return recommendedMealRepo.getRecommendedForYou();
  }
}
