abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final response;
  CategorySuccess(this.response);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
