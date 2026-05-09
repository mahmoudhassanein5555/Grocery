import 'package:bloc/bloc.dart';
import 'package:grocery1/features/home/domain/entity/category_section_entity.dart';
import 'package:grocery1/features/home/domain/usecase/category_section_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categorySectionUseCase) : super(CategoryInitial());
  final CategorySectionUseCase categorySectionUseCase;

  Future<void> getAllCategory() async {
    if (isClosed) return;
    emit(CategoryLoading());
    final request = await categorySectionUseCase.call();
    if (isClosed) return;
    request.fold(
      (failure) {
        if (!isClosed) emit(CategoryError(failure.failuremessage));
      },
      (meals) {
        if (!isClosed) emit(CategorySuccess(meals));
      },
    );
  }
}
