import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/data_layer/datasources/cart_data_source.dart';
import 'package:wasl_market_app/features/cart/data_layer/models/new_order_model.dart';
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
      await cartDataSource.createNewOrder(newOrder as NewOrderModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToCart(CartItemEntity product) async {
    try {
      await cartDataSource.addToCart(product);
      return right(null);
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
  Future<Either<Failure, void>> removeProductFromCart(
    CartItemEntity product,
  ) async {
    try {
      await cartDataSource.removeFromCart(product);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProductQuantity(
    CartItemEntity product,
    int quantity,
  ) async {
    try {
      await cartDataSource.updateCart(product.copyWith(quantity: quantity));
      return right(null);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }
}
