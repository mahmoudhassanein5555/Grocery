import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/features/home/data/data_source/category_section_remote_data_source.dart';
import 'package:grocery1/features/home/data/model/category_section_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/error/error.dart';

@Injectable(as: CategorySectionRemoteDataSource)
class CategorySectionRemoteDataSourceImpl
    implements CategorySectionRemoteDataSource {
  final ApiManager apiManager;

  CategorySectionRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<CategorySectionModel>> getAllCategory() async {
    try {
      final response =
          await apiManager.getData(endPoint: ApiEndpoints.categoriesEndpoint);
      if (response.statusCode == 200) {
        final List data = response.data['data'];
        return data.map((item) => CategorySectionModel.fromJson(item)).toList();
      }
      throw RemoteException(response.data['message']);
    } on RemoteException {
      rethrow;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
