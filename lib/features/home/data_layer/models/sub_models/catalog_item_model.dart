
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/catalog_item_entity.dart';

part '../../../../../core/database/catalog_item_model.g.dart';

@HiveType(typeId: DbTypeId.catalogItem)
class CatalogItemModel extends CatalogItemEntity {
  CatalogItemModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.name,
    @HiveField(2) required super.description,
    @HiveField(3) required super.sku,
    @HiveField(4) required super.searchSynonyms,
    @HiveField(5) required super.image,
    @HiveField(6) super.brand,
    @HiveField(7) super.categories,
  });

  factory CatalogItemModel.fromJson(Map<String, dynamic> json) {
    try {
      return CatalogItemModel(
        id: json['id'],
        name: json['name']['ar'],
        description: (json['description'] as List).isNotEmpty
            ? json['description']['ar']
            : '',
      sku: json['sku'],
      searchSynonyms: [],
      image: json['image'],
      // brand: BrandModel.fromJson(json['brand']),
      // categories: json['categories']
      //     .map((x) => CategoryModel.fromJson(x))
      //     .toList(),
    );
    } catch (e) {
      debugPrint('CatalogItemModel: $e');
      rethrow;
    }
  }
}