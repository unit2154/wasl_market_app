import 'package:wasl_market_app/features/home/data_layer/models/sub_models/brand_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/category_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/catalog_item_entity.dart';

class CatalogItemModel extends CatalogItemEntity {
  CatalogItemModel({
    required super.id,
    required super.name,
    required super.description,
    required super.sku,
    required super.searchSynonyms,
    required super.image,
    required super.brand,
    required super.categories,
  });

  factory CatalogItemModel.fromJson(Map<String, dynamic> json) {
    return CatalogItemModel(
      id: json['id'],
      name: json['name']['ar'],
      description: json['description']['ar'],
      sku: json['sku'],
      searchSynonyms: json['search_synonyms'],
      image: json['image'],
      brand: BrandModel.fromJson(json['brand']),
      categories: json['categories']
          .map((x) => CategoryModel.fromJson(x))
          .toList(),
    );
  }
}