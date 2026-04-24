import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/catalog_item_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/company_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required super.id,
    required super.catalogItem,
    required super.company,
    required super.availabilityStatus,
    required super.stockQuantity,
    required super.price,
    super.priceTiers,
    super.customSku,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    debugPrint('item: ${json['catalog_item']}');
    return ItemModel(
      id: json['id'],
      catalogItem: CatalogItemModel.fromJson(json['catalog_item']),
      company: CompanyModel.fromJson(json['company']),
      availabilityStatus: json['availability_status'],
      stockQuantity: json['stock_quantity'],
      price: json['price'],
      // priceTiers: json['price_tiers'],
      customSku: json['custom_sku'],
    );
  }
}