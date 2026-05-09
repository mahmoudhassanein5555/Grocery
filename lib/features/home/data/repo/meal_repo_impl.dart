import 'package:dartz/dartz.dart';
import 'package:grocery1/features/home/data/data_source/meals_remote_data_source.dart';
import 'package:grocery1/features/home/domain/entity/meal_entity.dart';
import 'package:grocery1/features/home/domain/repo/meals_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failure/failure.dart';

@Injectable(as: MealRepository)
class MealsRepositoryImpl implements MealRepository {
  final MealsRemoteDataSource remoteDataSource;

  MealsRepositoryImpl(this.remoteDataSource);

  @override
  @override
  Future<Either<Failure, List<MealEntity>>> getTodayDeals() async {
    try {
      final models = await remoteDataSource.getTodayDeals();
      final entities = models.map((e) => e.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
