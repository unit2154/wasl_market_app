import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/products/data_layer/data_sources/store_products_data_source.dart';
import 'package:wasl_market_app/features/products/domain_layer/repository/store_products_repo.dart';

class StoreProductsRepoImpl implements StoreProductsRepo {
  final StoreProductsDataSource productsDataSource;

  StoreProductsRepoImpl({required this.productsDataSource});

  @override
  Future<Either<Failure, ItemsListEntity>> getProducts() async {
    try {
      final products = await productsDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
