import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class ClearCart {
  final CartRepo cartRepo;

  ClearCart({required this.cartRepo});
  Future<Either<Failure, void>> call() async {
    return await cartRepo.clearCart();
  }
}
