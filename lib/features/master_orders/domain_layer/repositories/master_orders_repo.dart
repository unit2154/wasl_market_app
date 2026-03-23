import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_list_entity.dart';

abstract class MasterOrdersRepo {
  Future<Either<Failure, MasterOrdersListEntity>> getMasterOrders();
  Future<Either<Failure, void>> createMasterOrder(
    MasterOrderEntity masterOrder,
  );
}
