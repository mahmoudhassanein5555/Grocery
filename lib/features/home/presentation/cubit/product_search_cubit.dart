import 'package:bloc/bloc.dart';
import 'package:grocery1/features/home/domain/usecase/get_products_search_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/products_search_entity.dart';

part 'product_search_state.dart';

@injectable
class ProductSearchCubit extends Cubit<ProductSearchState> {
  final GetProductsSearchUseCase getProductsSearchUseCase;

  ProductSearchCubit(this.getProductsSearchUseCase)
      : super(ProductSearchInitial());

  bool hasSearch = false;

  Future<void> getProducts({
    String? search,
    int? categoryId,
    int? subcategoryId,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    String? brand,
    bool? featured,
    bool? inStock,
    String? sortBy,
    String? sortOrder,
  }) async {
    if (isClosed) return;

    hasSearch = search != null && search.isNotEmpty;

    emit(ProductSearchLoading());

    final result = await getProductsSearchUseCase(
      search: search,
      categoryId: categoryId,
      subcategoryId: subcategoryId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minRating: minRating,
      brand: brand,
      featured: featured,
      inStock: inStock,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(ProductSearchError(failure.failuremessage));
      },
      (data) {
        if (!isClosed) emit(ProductSearchSuccess(data));
      },
    );
  }

  void clearSearch() {
    hasSearch = false;
    emit(ProductSearchInitial());
  }
}
