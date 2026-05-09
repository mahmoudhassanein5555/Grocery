import 'package:grocery1/features/product_details/domain/use_case/product_details_use_case.dart';
import 'package:grocery1/features/product_details/domain/use_case/toggle_favorite_use_case.dart';
import 'package:grocery1/features/product_details/domain/use_case/add_to_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/product_details/presentation/view_model/product_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsUseCase, this._toggleFavoriteUseCase,
      this._addToCartUseCase)
      : super(ProductDetailsInitialState());
  final ProductDetailsUseCase _productDetailsUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  final AddToCartUseCase _addToCartUseCase;
  Future<void> getProductDetails(int productId) async {
    emit(ProductDetailsLoadingState());
    final result = await _productDetailsUseCase.invoke(productId);
    result.fold(
      (failure) =>
          emit(ProductDetailsErrorState(errorMessage: failure.failuremessage)),
      (productDetails) => emit(
        ProductDetailsSuccessState(
          productDetailsResponseEntity: productDetails,
        ),
      ),
    );
  }

  Future<void> toggleFavorite(int productId) async {
    final result = await _toggleFavoriteUseCase.invoke(productId);
    result.fold(
      (failure) => emit(ProductDetailsToggleFavoriteErrorState(
          errorMessage: failure.failuremessage)),
      (response) => emit(
        ProductDetailsToggleFavoriteSuccessState(response: response),
      ),
    );
  }

  Future<void> addToCart(int mealId, int quantity) async {
    final result = await _addToCartUseCase.invoke(mealId, quantity);
    result.fold(
      (failure) => emit(ProductDetailsAddToCartErrorState(
          errorMessage: failure.failuremessage)),
      (response) => emit(
        ProductDetailsAddToCartSuccessState(response: response),
      ),
    );
  }
}
