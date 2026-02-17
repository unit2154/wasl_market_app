import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';

class NewOrderModel extends NewOrderEntity {
  NewOrderModel({
    required super.mainCustomerId,
    required super.items,
    required super.shippingAddress,
    required super.notes,
  });

  factory NewOrderModel.fromJson(Map<String, dynamic> json) {
    return NewOrderModel(
      mainCustomerId: json['main_customer_id'],
      items: json['items'],
      shippingAddress: json['shipping_address'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main_customer_id': mainCustomerId,
      'items': items,
      'shipping_address': shippingAddress,
      'notes': notes,
    };
  }
}
