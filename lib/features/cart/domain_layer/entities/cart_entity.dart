import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> products;

  CartEntity({required this.products});

  double get totalPrice =>
      products.fold(0, (sum, item) => sum + double.parse(item.total));
}
