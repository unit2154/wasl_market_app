import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/products/domain_layer/repository/store_products_repo.dart';

class GetStoreProductsUseCase {
  final StoreProductsRepo productsRepo;

  GetStoreProductsUseCase(this.productsRepo);

  Future<Either<Failure, ItemsListEntity>> call() async {
    return await productsRepo.getProducts();
  }
}
