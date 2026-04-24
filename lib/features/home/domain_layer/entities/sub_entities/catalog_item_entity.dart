import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/brand_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/category_entity.dart';

class CatalogItemEntity {
  final int id;
  final String name;
  final String description;
  final String sku;
  final List<String> searchSynonyms;
  final String image;
  final BrandEntity? brand;
  final List<CategoryEntity> categories;

  CatalogItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.searchSynonyms,
    required this.image,
    this.brand,
    required this.categories,
  });
}
