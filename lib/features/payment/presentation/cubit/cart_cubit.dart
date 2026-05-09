import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/cart/data/repositories/cart_repository.dart';
import 'package:grocery1/features/cart/domain/usecase/getcart_usecase.dart';
import 'package:grocery1/features/cart/presentation/cubit/cart_state.dart';

class minacartcubit extends Cubit<minacartstate> {
  CartRepositoryImpl repository = CartRepositoryImpl();
  GetcartUsecase getcartUsecase = GetcartUsecase();
  DeleteCartItemUseCase deleteCartItemUseCase = DeleteCartItemUseCase();

  minacartcubit() : super(CartInitial());

  Future<void> fetchcart() async {
    emit(CartLoading());
    final result = await getcartUsecase.call();
    result.fold(
      (failure) => emit(CartError(failure.failuremessage)),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  Future<void> deleteItem(int itemId) async {
    try {
      emit(CartLoading());

      await deleteCartItemUseCase.call(itemId);

      await fetchcart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
