import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/new_order_item_entity.dart';

class NewOrderEntity {
  final String mainCustomerId;
  final List<NewOrderItemEntity> items;
  final String shippingAddress;
  final String notes;

  NewOrderEntity({
    required this.mainCustomerId,
    required this.items,
    required this.shippingAddress,
    required this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'mainCustomerId': mainCustomerId,
      'items': items.map((item) => item.toJson()).toList(),
      'shippingAddress': shippingAddress,
      'notes': notes,
    };
  }
}
