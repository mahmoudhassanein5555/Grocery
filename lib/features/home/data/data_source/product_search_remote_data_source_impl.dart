import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/home/data/data_source/product_search_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../model/product_search_model.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiManager apiManager;

  ProductRemoteDataSourceImpl(this.apiManager);

  @override
  Future<ProductSearchModel> getProducts({
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
    final response = await apiManager.getData(
      endPoint: ApiEndpoints.mealsEndpoint,
      queryParameters: {
        if (search != null) 'search': search,
        if (categoryId != null) 'category_id': categoryId,
        if (subcategoryId != null) 'subcategory_id': subcategoryId,
        if (minPrice != null) 'min_price': minPrice,
        if (maxPrice != null) 'max_price': maxPrice,
        if (minRating != null) 'min_rating': minRating,
        if (brand != null) 'brand': brand,
        if (featured != null) 'featured': featured,
        if (inStock != null) 'in_stock': inStock,
        if (sortBy != null) 'sort_by': sortBy,
        if (sortOrder != null) 'sort_order': sortOrder,
      },
    );

    return ProductSearchModel.fromJson(response.data);
  }
}
