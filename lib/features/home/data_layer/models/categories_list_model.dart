import 'package:wasl_market_app/features/home/data_layer/models/sub_models/category_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';

class CategoriesListModel extends CategoriesListEntity {
  CategoriesListModel({required super.categories, super.nextPageUrl});
  factory CategoriesListModel.fromJson(List<dynamic> json) {
    return CategoriesListModel(
      categories: json.map((e) => CategoryModel.fromJson(e)).toList(),
    );
  }
}
