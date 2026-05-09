import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:grocery1/features/subcategories/domain/usecases/categories_usecase.dart';
import 'category_state.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoryState> {
  final CategoriesUseCase categoriesUseCase;

  CategoriesViewModel({required this.categoriesUseCase})
      : super(CategoryInitial());

  int selectedIndex = 0;

  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await categoriesUseCase.invoke();
    result.fold(
      (failure) => emit(CategoryError(failure.failuremessage)),
      (response) => emit(CategorySuccess(response)),
    );
  }

  void changeIndex(int index) {
    selectedIndex = index;
    final current = state;
    if (current is CategorySuccess) {
      emit(CategorySuccess(current.response));
    }
  }
}
