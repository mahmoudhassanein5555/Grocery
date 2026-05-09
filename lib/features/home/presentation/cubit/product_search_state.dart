part of 'product_search_cubit.dart';

@immutable
sealed class ProductSearchState {}

final class ProductSearchInitial extends ProductSearchState {}

final class ProductSearchLoading extends ProductSearchState {}

final class ProductSearchSuccess extends ProductSearchState {
  final ProductSearchEntity productSearchEntity;
  ProductSearchSuccess(this.productSearchEntity);
}

final class ProductSearchError extends ProductSearchState {
  final String message;
  ProductSearchError(this.message);
}
