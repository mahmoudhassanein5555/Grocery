import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';
import 'package:grocery1/features/my_list/domain/repository/smart_list/smart_list_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSmartListsUseCase {
  final SmartListRepository _repository;

  GetSmartListsUseCase(this._repository);

  Future<Either<Failure, List<SmartListEntity>>> invoke() =>
      _repository.getSmartLists();
}
