import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/new_order_item_entity.dart';

class NewOrderItemModel extends NewOrderItemEntity {
  NewOrderItemModel({required super.itemId, required super.quantity});

  factory NewOrderItemModel.fromJson(Map<String, dynamic> json) {
    return NewOrderItemModel(
      itemId: json['item_id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'item_id': itemId, 'quantity': quantity};
  }
}
