import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/products/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_market_app/features/products/domain_layer/repository/store_products_repo.dart';

class GetStoreProductsUseCase {
  final StoreProductsRepo productsRepo;

  GetStoreProductsUseCase(this.productsRepo);

  Future<Either<Failure, ProductsListEntity>> call() async {
    return await productsRepo.getProducts();
  }
}
