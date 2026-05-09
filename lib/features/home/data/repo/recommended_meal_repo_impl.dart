import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/home/data/data_source/recommended_meal_remote_data_source.dart';
import 'package:grocery1/features/home/domain/entity/recommended_meal_entity.dart';
import 'package:grocery1/features/home/domain/repo/recommended_meal_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RecommendedMealRepo)
class RecommendedMealRepoImpl implements RecommendedMealRepo {
  final RecommendedMealRemoteDataSource recommendedMealRemoteDataSource;

  RecommendedMealRepoImpl(this.recommendedMealRemoteDataSource);

  @override
  Future<Either<Failure, List<RecommendedMealEntity>>>
      getRecommendedForYou() async {
    try {
      final models =
          await recommendedMealRemoteDataSource.getRecommendedForYou();
      return Right(models);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
