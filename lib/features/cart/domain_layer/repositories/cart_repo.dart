import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> createNewOrder(NewOrderEntity newOrder);
}
