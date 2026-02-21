import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class UpdateCart {
  final CartRepo cartRepo;

  UpdateCart(this.cartRepo);

  Future<Either<Failure, CartEntity>> call(
    CartItemEntity product,
    int quantity,
  ) async {
    return await cartRepo.updateProductQuantity(product, quantity);
  }
}
