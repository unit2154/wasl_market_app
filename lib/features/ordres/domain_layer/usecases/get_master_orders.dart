import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/master_order_list_entity.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/repository/orders_repo.dart';

class GetMasterOrders {
  final OrdersRepo repo;
  GetMasterOrders({required this.repo});

  Future<Either<Failure, MasterOrdersListEntity>> call() async {
    return await repo.getMasterOrders();
  }
}
