import 'package:grocery1/features/my_list/data/api/my_list_api.dart';
import 'package:grocery1/features/my_list/data/datasources/favorites/favorites_data_source.dart';
import 'package:grocery1/features/my_list/data/models/favorite_model.dart';
import 'package:grocery1/features/my_list/data/models/favorite_toggle_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesDataSource)
class FavoritesDataSourceImpl implements FavoritesDataSource {
  final MyListApi _myListApi;

  FavoritesDataSourceImpl(this._myListApi);

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    var responseModel = await _myListApi.fetchFavorites();
    return responseModel.data ?? [];
  }

  @override
  Future<FavoriteToggleDataModel> removeFavorite(int mealId) async {
    var response = await _myListApi.removeFavorite(mealId);
    return response;
  }
}
