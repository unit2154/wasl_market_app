import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/item_entity.dart';

class CartItemEntity {
  final ItemEntity product;
  final int quantity;

  CartItemEntity({required this.product, required this.quantity});

  String get total => (product.price * quantity).toStringAsFixed(2);

  CartItemEntity copyWith({ItemEntity? product, int? quantity}) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
