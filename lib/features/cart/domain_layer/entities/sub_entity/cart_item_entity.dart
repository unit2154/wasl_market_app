import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  final int quantity;

  CartItemEntity({required this.product, required this.quantity});

  String get total =>
      (double.parse(product.price) * quantity).toStringAsFixed(2);

  CartItemEntity copyWith({ProductEntity? product, int? quantity}) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
