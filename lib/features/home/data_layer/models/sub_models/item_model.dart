import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/catalog_item_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/company_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/item_entity.dart';

part '../../../../../core/database/product_model.g.dart';

@HiveType(typeId: DbTypeId.item)
class ItemModel extends ItemEntity {
  ItemModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.catalogItem,
    @HiveField(2) required super.company,
    @HiveField(3) required super.availabilityStatus,
    @HiveField(4) required super.stockQuantity,
    @HiveField(5) required super.price,
    @HiveField(6) super.priceTiers,
    @HiveField(7) super.customSku,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    try {
      return ItemModel(
        id: json['id'],
        catalogItem: CatalogItemModel.fromJson(json['catalog_item']),
        company: CompanyModel.fromJson(json['company']),
        availabilityStatus: json['availability_status'],
        stockQuantity: json['stock_quantity'],
        price: json['price']/1.0,
        // priceTiers: json['price_tiers'],
        customSku: json['custom_sku'],
      );
    } catch (e) {
      debugPrint('ItemModel: id= ${json['id']} $e');
      rethrow;
    }
  }
}