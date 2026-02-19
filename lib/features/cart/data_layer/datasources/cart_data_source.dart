import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';

abstract class CartDataSource {
  Future<void> addToCart(CartItemEntity item);
  Future<void> removeFromCart(CartItemEntity item);
  Future<void> updateCart(CartItemEntity item);
  Future<void> clearCart();
  Future<CartEntity> getCart();
  // Future<void> checkout();

  Future<void> createNewOrder(NewOrderEntity order);
}
