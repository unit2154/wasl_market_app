import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class GetProductsUseCase {
  final HomeRepo homeRepo;

  GetProductsUseCase(this.homeRepo);

  Future<Either<Failure, ProductsListEntity>> call() async {
    return await homeRepo.getProducts();
  }
}
