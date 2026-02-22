import 'package:wasl_market_app/features/cart/data_layer/models/sub_model/new_order_item_model.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';

class NewOrderModel extends NewOrderEntity {
  NewOrderModel({
    required super.mainCustomerId,
    required super.items,
    required super.shippingAddress,
    required super.notes,
  });

  factory NewOrderModel.fromEntity(NewOrderEntity entity) {
    return NewOrderModel(
      mainCustomerId: entity.mainCustomerId,
      items: entity.items,
      shippingAddress: entity.shippingAddress,
      notes: entity.notes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main_customer_id': mainCustomerId,
      'items': items
          .map((item) => NewOrderItemModel.fromEntity(item).toJson())
          .toList(),
      'shipping_address': shippingAddress,
      'notes': notes,
    };
  }
}
