import 'package:grocery1/features/my_list/data/models/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/data/models/history_model.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';

abstract class HistoryDataSource {
  Future<List<HistoryModel>> getHistory({FilterModel? filters});
  Future<FavoriteToggleDataModel> addRemoveFavorite(int mealId);
}
