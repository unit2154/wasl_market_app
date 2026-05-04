import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/new_order_item_entity.dart';

class NewOrderEntity {
  final int addressId;
  final List<NewOrderItemEntity> items;
  final String paymentType;
  final String notes;

  NewOrderEntity({
    required this.addressId,
    required this.items,
    required this.paymentType,
    required this.notes,
  });
}
