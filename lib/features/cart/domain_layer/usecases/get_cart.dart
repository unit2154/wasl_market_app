import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class GetCart {
  final CartRepo cartRepo;

  GetCart(this.cartRepo);

  Future<Either<Failure, CartEntity>> call() async {
    return await cartRepo.getCart();
  }
}
