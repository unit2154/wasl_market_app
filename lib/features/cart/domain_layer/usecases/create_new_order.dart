import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class CreateNewOrder {
  final CartRepo cartRepo;

  CreateNewOrder({required this.cartRepo});
  Future<Either<Failure, void>> call(NewOrderEntity params) async {
    return await cartRepo.createNewOrder(params);
  }
}
