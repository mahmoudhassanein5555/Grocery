part of 'recommended_cubit.dart';

@immutable
sealed class RecommendedState {}

final class RecommendedInitial extends RecommendedState {}

final class RecommendedLoading extends RecommendedState {}

final class RecommendedSuccess extends RecommendedState {
  final List<RecommendedMealEntity> meals;

  RecommendedSuccess(this.meals);
}

final class RecommendedError extends RecommendedState {
  final String errorMessage;

  RecommendedError(this.errorMessage);
}
