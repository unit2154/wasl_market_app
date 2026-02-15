import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class GetProductByIdUseCase {
  final HomeRepo homeRepo;

  GetProductByIdUseCase(this.homeRepo);

  Future<Either<Failure, ProductEntity>> call(int id) async {
    return await homeRepo.getProductById(id);
  }
}
