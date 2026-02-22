import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/products/domain_layer/entities/products_list_entity.dart';

abstract class StoreProductsRepo {
  Future<Either<Failure, ProductsListEntity>> getProducts();
}
