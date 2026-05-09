import 'package:grocery1/features/my_list/data/models/smart_list_model.dart';

abstract class SmartListDataSource {
  Future<List<SmartListModel>> getSmartLists();
  Future<String> deleteSmartList(int id);
  Future<String> addAllToCart({required int mealId, required int quantity});
}
