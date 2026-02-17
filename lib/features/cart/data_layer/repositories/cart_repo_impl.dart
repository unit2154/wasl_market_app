import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/data_layer/datasources/cart_data_source.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartDataSource cartDataSource;
  CartRepoImpl({required this.cartDataSource});
  @override
  Future<Either<Failure, void>> createNewOrder(NewOrderEntity newOrder) async {
    try {
      await cartDataSource.createNewOrder(newOrder);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
