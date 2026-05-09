import 'package:grocery1/features/my_list/data/api/my_list_api.dart';
import 'package:grocery1/features/my_list/data/datasources/history/history_data_source.dart';
import 'package:grocery1/features/my_list/data/models/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/data/models/history_model.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HistoryDataSource)
class HistoryDataSourceImpl implements HistoryDataSource {
  final MyListApi _myListApi;

  HistoryDataSourceImpl(this._myListApi);

  @override
  Future<List<HistoryModel>> getHistory({FilterModel? filters}) async {
    final queryParameters = filters?.toQueryParameters();
    var responseModel = await _myListApi.fetchHistory(
      queryParameters: queryParameters,
    );
    return responseModel.data ?? [];
  }

  @override
  Future<FavoriteToggleDataModel> addRemoveFavorite(int mealId) async {
    var response = await _myListApi.removeFavorite(mealId);
    return response;
  }
}
