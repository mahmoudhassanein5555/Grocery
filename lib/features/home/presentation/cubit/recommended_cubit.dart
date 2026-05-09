import 'package:bloc/bloc.dart';
import 'package:grocery1/features/home/domain/entity/recommended_meal_entity.dart';
import 'package:grocery1/features/home/domain/usecase/recommended_meal_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'recommended_state.dart';

@injectable
class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.recommendedMealUseCase) : super(RecommendedInitial());
  final RecommendedMealUseCase recommendedMealUseCase;

  Future<void> getRecommendedForYou() async {
    if (isClosed) return;
    emit(RecommendedLoading());
    final request = await recommendedMealUseCase.call();
    if (isClosed) return;
    request.fold(
      (failure) {
        if (!isClosed) emit(RecommendedError(failure.failuremessage));
      },
      (meals) {
        if (!isClosed) emit(RecommendedSuccess(meals));
      },
    );
  }
}
