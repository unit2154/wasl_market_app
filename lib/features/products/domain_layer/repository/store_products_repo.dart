import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';

abstract class StoreProductsRepo {
  Future<Either<Failure, ItemsListEntity>> getProducts();
}
