import 'package:flutter/foundation.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/sub_entities/order_item_entity.dart';
import 'package:wasl_market_app/features/home/data_layer/models/sub_models/item_model.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.id,
    required super.orderId,
    super.itemId,
    required super.orderedQuantity,
    required super.confirmedQuantity,
    required super.unitPrice,
    required super.subtotal,
    required super.notes,
    required super.createdAt,
    required super.updatedAt,
    super.item,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    try {
      return OrderItemModel(
        id: json['id'],
        orderId: json['order_id'],
        itemId: json['item_id'],
        orderedQuantity: json['ordered_quantity'],
        confirmedQuantity: json['confirmed_quantity'],
        unitPrice: json['unit_price'],
        subtotal: json['subtotal'],
        notes: json['notes'] ?? "",
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        item: json['item'] != null ? ItemModel.fromJson(json['item']) : null,
      );
    } on Exception catch (e) {
      debugPrint("OrderItemModel.fromJson error: ${e.toString()}");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'item_id': itemId,
      'ordered_quantity': orderedQuantity,
      'confirmed_quantity': confirmedQuantity,
      'unit_price': unitPrice,
      'subtotal': subtotal,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
      // 'item': (item as ItemModel?)?.toJson(),
    };
  }
}
