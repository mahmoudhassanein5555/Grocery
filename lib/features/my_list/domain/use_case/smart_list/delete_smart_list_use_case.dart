import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/my_list/domain/repository/smart_list/smart_list_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteSmartListUseCase {
  final SmartListRepository _repository;
  DeleteSmartListUseCase(this._repository);
  Future<Either<Failure, String>> invoke(int id) =>
      _repository.deleteSmartList(id);
}
