import 'package:grocery1/features/my_list/data/api/my_list_api.dart';
import 'package:grocery1/features/my_list/data/datasources/smart_list/smart_list_data_source_imp.dart';
import 'package:grocery1/features/my_list/data/models/smart_list_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartListDataSource)
class SmartListDataSourceImpl implements SmartListDataSource {
  final MyListApi _myListApi;
  SmartListDataSourceImpl(this._myListApi);

  @override
  Future<List<SmartListModel>> getSmartLists() async {
    var responseModel = await _myListApi.fetchSmartLists();
    return responseModel.data ?? [];
  }

  @override
  Future<String> deleteSmartList(int id) async =>
      await _myListApi.deleteSmartList(id);

  @override
  Future<String> addAllToCart({
    required int mealId,
    required int quantity,
  }) async =>
      await _myListApi.addToCart(mealId: mealId, quantity: quantity);
}
