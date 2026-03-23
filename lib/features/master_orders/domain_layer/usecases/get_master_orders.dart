import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_list_entity.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/repositories/master_orders_repo.dart';

class GetMasterOrdersUseCase {
  final MasterOrdersRepo repo;
  GetMasterOrdersUseCase({required this.repo});

  Future<Either<Failure, MasterOrdersListEntity>> call() async {
    return await repo.getMasterOrders();
  }
}
