import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/category_entity.dart';

class CategoriesListEntity {
  final List<CategoryEntity> categories;
  final String? nextPageUrl;
  CategoriesListEntity({required this.categories, this.nextPageUrl});
}
