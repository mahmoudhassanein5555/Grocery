import 'package:grocery1/features/my_list/data/models/favorite_model.dart';
import 'package:grocery1/features/my_list/data/models/favorite_toggle_model.dart';

abstract class FavoritesDataSource {
  Future<List<FavoriteModel>> getFavorites();
  Future<FavoriteToggleDataModel> removeFavorite(int mealId);
}
