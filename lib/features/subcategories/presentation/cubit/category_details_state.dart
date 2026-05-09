abstract class CategoryDetailsState {}

class CategoryDetailsInitial extends CategoryDetailsState {}

class CategoryDetailsLoading extends CategoryDetailsState {}

class CategoryDetailsSuccess extends CategoryDetailsState {
  final response;
  CategoryDetailsSuccess(this.response);
}

class CategoryDetailsError extends CategoryDetailsState {
  final String message;
  CategoryDetailsError(this.message);
}
