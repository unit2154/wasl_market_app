import 'package:wasl_market_app/features/cart/data_layer/models/sub_model/new_order_item_model.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';

class NewOrderModel extends NewOrderEntity {
  NewOrderModel({
    required super.addressId,
    required super.items,
    required super.paymentType,
    required super.notes,
  });

  factory NewOrderModel.fromEntity(NewOrderEntity entity) {
    return NewOrderModel(
      addressId: entity.addressId,
      items: entity.items,
      paymentType: entity.paymentType,
      notes: entity.notes,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'company_id': mainCustomerId,
  //     'items': items
  //         .map((item) => NewOrderItemModel.fromEntity(item).toJson())
  //         .toList(),
  //     'shipping_address': shippingAddress,
  //     'notes': notes,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      'address_id': addressId,
      'payment_type': paymentType,
      'items': items.map((v) => NewOrderItemModel.fromEntity(v).toJson()).toList(),
      'notes': notes,
    };
  }
}
