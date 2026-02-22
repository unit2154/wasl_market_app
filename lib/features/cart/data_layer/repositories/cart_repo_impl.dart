import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/data_layer/datasources/cart_data_source.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartDataSource cartDataSource;
  CartRepoImpl({required this.cartDataSource});

  @override
  Future<Either<Failure, void>> createNewOrder(NewOrderEntity newOrder) async {
    try {
      await cartDataSource.createNewOrder(newOrder);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> addProductToCart(
    CartItemEntity product,
  ) async {
    try {
      final cart = await cartDataSource.addToCart(product);
      return right(cart);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final cart = await cartDataSource.getCart();
      return right(cart);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> removeProductFromCart(
    CartItemEntity product,
  ) async {
    try {
      final cart = await cartDataSource.removeFromCart(product);
      return right(cart);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateProductQuantity(
    CartItemEntity product,
    int quantity,
  ) async {
    try {
      final cart = await cartDataSource.updateCart(
        product.copyWith(quantity: quantity),
      );
      return right(cart);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    try {
      await cartDataSource.clearCart();
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
