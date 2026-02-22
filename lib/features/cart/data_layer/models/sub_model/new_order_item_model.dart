import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/new_order_item_entity.dart';

class NewOrderItemModel extends NewOrderItemEntity {
  NewOrderItemModel({required super.itemId, required super.quantity});

  factory NewOrderItemModel.fromEntity(NewOrderItemEntity entity) {
    return NewOrderItemModel(itemId: entity.itemId, quantity: entity.quantity);
  }

  Map<String, dynamic> toJson() {
    return {'item_id': itemId, 'quantity': quantity};
  }
}
