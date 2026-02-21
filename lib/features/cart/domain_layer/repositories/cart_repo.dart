import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> addProductToCart(CartItemEntity product);
  Future<Either<Failure, CartEntity>> removeProductFromCart(
    CartItemEntity product,
  );
  Future<Either<Failure, CartEntity>> updateProductQuantity(
    CartItemEntity product,
    int quantity,
  );

  Future<Either<Failure, CartEntity>> getCart();

  Future<Either<Failure, void>> createNewOrder(NewOrderEntity newOrder);
}
