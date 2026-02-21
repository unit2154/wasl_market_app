import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/exceptions/exceptions.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/cart/data_layer/datasources/cart_data_source.dart';
import 'package:wasl_market_app/features/cart/data_layer/models/cart_model.dart';
import 'package:wasl_market_app/features/cart/data_layer/models/sub_model/cart_item_model.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';

class CartDataSourceImpl implements CartDataSource {
  final DioApiConsumer apiService;
  final Box<TokenEntity> tokenBox;
  final Box<CartModel> cartBox;
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
  Future<CartEntity> addToCart(CartItemEntity item) async {
    try {
      var cart = await getCart();
      CartItemModel cartItem = CartItemModel.fromEntity(item);
      if (cart.products.any(
        (element) => element.product.id == item.product.id,
      )) {
        var existedItem = cart.products.firstWhere(
          (element) => element.product.id == item.product.id,
        );
        cart.products[cart.products.indexWhere(
          (element) => element.product.id == item.product.id,
        )] = CartItemModel(
          product: existedItem.product,
          quantity: existedItem.quantity + cartItem.quantity,
        );
      } else {
        cart.products.add(cartItem);
      }
      cartBox.putAt(0, cart);
      return Future.value(cart);
    } catch (e) {
      print(e);
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<CartEntity> clearCart() {
    try {
      cartBox.deleteAt(0);
      return Future.value(CartEntity(products: []));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<CartModel> getCart() {
    try {
      var cart = cartBox.get('cart');
      if (cart == null) {
        cart = CartModel(products: []);
        cartBox.put('cart', cart);
      }
      return Future.value(cart);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<CartEntity> removeFromCart(CartItemEntity item) async {
    try {
      var cart = await getCart();
      cart.products.removeWhere(
        (element) => element.product.id == item.product.id,
      );
      cartBox.putAt(0, cart);
      return Future.value(cart);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<CartEntity> updateCart(CartItemEntity item) async {
    try {
      var cart = await getCart();
      CartItemModel cartItem = CartItemModel.fromEntity(item);
      cart.products[cart.products.indexWhere(
            (element) => element.product.id == item.product.id,
          )] =
          cartItem;
      cartBox.putAt(0, cart);
      return Future.value(cart);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
