import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';
import 'package:grocery1/features/my_list/domain/use_case/history/add_remove_favorites.dart';
import 'package:grocery1/features/my_list/domain/use_case/history/add_to_cart_use_case.dart';
import 'package:grocery1/features/my_list/domain/use_case/history/get_history_use_case.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final AddRemoveFavoritesUseCase _addRemoveFavoriteUseCase;
  final AddToCartHistoryUseCase _addToCartUseCase;

  HistoryCubit(
    this._getHistoryUseCase,
    this._addRemoveFavoriteUseCase,
    this._addToCartUseCase,
  ) : super(HistoryInitial());
  List<HistoryEntity> historyItems = [];

  Future<void> fetchHistory({FilterModel? filters}) async {
    if (isClosed) return;
    emit(HistoryLoading());
    final result = await _getHistoryUseCase.invoke();
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(HistoryError(failure.failuremessage));
      },
      (historyItems) {
        if (!isClosed) {
          if (filters != null) {
            final filteredList = historyItems.where((item) {
              bool matchesCategory = true;
              bool matchesPrice = true;
              bool matchesRating = true;

              if (filters.categories != null &&
                  filters.categories!.isNotEmpty) {
                final filterCats = filters.categories!
                    .map((c) => c.toLowerCase().trim())
                    .toList();
                final itemCategory = item.subtitle.toLowerCase().trim();
                final itemTitle = item.title.toLowerCase().trim();
                matchesCategory = filterCats.contains(itemCategory) ||
                    filterCats.contains(itemTitle);
              }

              if (filters.minPrice != null || filters.maxPrice != null) {
                final price = double.tryParse(item.price.toString()) ?? 0.0;
                if (filters.minPrice != null && price < filters.minPrice!)
                  matchesPrice = false;
                if (filters.maxPrice != null && price > filters.maxPrice!)
                  matchesPrice = false;
              }

              if (filters.rating != null) {
                if (item.rating < filters.rating!) matchesRating = false;
              }

              return matchesCategory && matchesPrice && matchesRating;
            }).toList();

            this.historyItems = List.from(filteredList);
            emit(HistoryLoaded(filteredList));
          } else {
            this.historyItems = List.from(historyItems);
            emit(HistoryLoaded(this.historyItems));
          }
        }
      },
    );
  }

  Future<void> addRemoveFavorite(int mealId) async {
    if (isClosed) return;
    final result = await _addRemoveFavoriteUseCase.invoke(mealId);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(HistoryError(failure.failuremessage));
      },
      (success) {
        if (!isClosed) {
          emit(AddRemoveFavoriteSuccess(success));
          emit(HistoryLoaded(historyItems));
        }
      },
    );
  }

  Future<void> addToCart(int mealId) async {
    if (isClosed) return;
    final result = await _addToCartUseCase.invoke(mealId);

    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AddToCartHistoryError(failure.failuremessage));
          emit(HistoryLoaded(List.from(historyItems)));
        }
      },
      (success) {
        if (!isClosed) {
          emit(AddToCartSuccess(success));
          emit(HistoryLoaded(List.from(historyItems)));
        }
      },
    );
  }
}
