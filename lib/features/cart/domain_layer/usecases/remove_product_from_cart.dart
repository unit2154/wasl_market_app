import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class RemoveFromCart {
  final CartRepo cartRepo;

  RemoveFromCart(this.cartRepo);

  Future<Either<Failure, CartEntity>> call(CartItemEntity product) async {
    return await cartRepo.removeProductFromCart(product);
  }
}
