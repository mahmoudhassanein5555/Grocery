import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';
import 'package:grocery1/features/my_list/domain/repository/history/history_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHistoryUseCase {
  final HistoryRepository _repository;

  GetHistoryUseCase(this._repository);

  Future<Either<Failure, List<HistoryEntity>>> invoke({FilterModel? filters}) =>
      _repository.getHistory(filters: filters);
}
