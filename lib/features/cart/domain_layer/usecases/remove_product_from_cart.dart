import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class RemoveProductFromCart {
  final CartRepo cartRepo;

  RemoveProductFromCart(this.cartRepo);

  Future<Either<Failure, void>> call(CartItemEntity product) async {
    return await cartRepo.removeProductFromCart(product);
  }
}
