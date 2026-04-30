import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/item_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';

class ItemsListModel extends ItemsListEntity {
  ItemsListModel({required super.items, super.nextPageUrl});

  factory ItemsListModel.fromJson(Map<String, dynamic> json) {
    try {
      return ItemsListModel(
        items: (json['data'] as List)
            .map((x) => ItemModel.fromJson(x))
            .toList(),
        nextPageUrl: json['next_page_url'],
      );
    } on Exception catch (e) {
      debugPrint(' ItemsListModel: $e');
      rethrow;
    }
  }
}
