import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/master_orders/data_layer/datasources/orders_data_source.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_list_entity.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/repositories/master_orders_repo.dart';

class MasterOrdersRepoImpl implements MasterOrdersRepo {
  final MasterOrdersDataSource masterOrdersDataSource;
  MasterOrdersRepoImpl({required this.masterOrdersDataSource});

  @override
  Future<Either<Failure, MasterOrdersListEntity>> getMasterOrders() async {
    try {
      final masterOrderList = await masterOrdersDataSource.getMasterOrders();
      return Right(masterOrderList);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createMasterOrder(
    MasterOrderEntity masterOrder,
  ) {
    // TODO: implement createMasterOrder
    throw UnimplementedError();
  }
}
