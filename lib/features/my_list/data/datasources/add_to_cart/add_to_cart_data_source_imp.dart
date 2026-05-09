import 'package:grocery1/features/my_list/data/api/my_list_api.dart';
import 'package:grocery1/features/my_list/data/datasources/add_to_cart/add_to_cart_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartDataSource)
class AddToCartDataSourceImp extends AddToCartDataSource {
  final MyListApi _myListApi;

  AddToCartDataSourceImp(this._myListApi);

  @override
  Future<String> addToCart(int mealId) async {
    var response = await _myListApi.addToCart(mealId: mealId, quantity: 1);
    return response;
  }
}
