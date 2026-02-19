import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/exceptions/exceptions.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/cart/data_layer/datasources/cart_data_source.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';

class CartDataSourceImpl implements CartDataSource {
  final DioApiConsumer apiService;
  final Box<TokenEntity> tokenBox;
  final Box<CartEntity> cartBox;
  CartDataSourceImpl({
    required this.apiService,
    required this.tokenBox,
    required this.cartBox,
  });
  @override
  Future<void> createNewOrder(NewOrderEntity order) async {
    try {
      await apiService.post(
        Endpoints.createNewOrder,
        headers: {"Authorization": "Bearer ${tokenBox.getAt(0)?.token}"},
        data: order.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            'حدث خطأ ما',
      );
    }
  }

  @override
  Future<void> addToCart(CartItemEntity item) async {
    try {
      var cart = await getCart();
      cart.products.add(item);
      cartBox.putAt(0, cart);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> clearCart() {
    try {
      cartBox.deleteAt(0);
      return Future.value();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<CartEntity> getCart() {
    try {
      CartEntity cart = cartBox.getAt(0) ?? CartEntity(products: []);
      return Future.value(cart);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeFromCart(CartItemEntity item) async {
    try {
      var cart = await getCart();
      cart.products.remove(item);
      cartBox.putAt(0, cart);
      return Future.value();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> updateCart(CartItemEntity item) async {
    try {
      var cart = await getCart();
      cart.products[cart.products.indexWhere(
            (element) => element.product.id == item.product.id,
          )] =
          item;
      cartBox.putAt(0, cart);
      return Future.value();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
