import 'package:grocery1/features/home/data/model/category_section_model.dart';

abstract class CategorySectionRemoteDataSource {
  Future<List<CategorySectionModel>> getAllCategory();
}
