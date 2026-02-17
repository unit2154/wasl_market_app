import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';

abstract class CartDataSource {
  // Future<void> addToCart(NewOrderItemModel item);
  // Future<void> removeFromCart(NewOrderItemModel item);
  // Future<void> updateCart(NewOrderItemModel item);
  // Future<void> clearCart();
  // Future<List<NewOrderItemModel>> getCart();
  // Future<void> checkout();

  Future<void> createNewOrder(NewOrderEntity order);
}
