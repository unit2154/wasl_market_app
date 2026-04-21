import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class GetBrandsUseCase {
  final HomeRepo homeRepo;
  GetBrandsUseCase({required this.homeRepo});
  Future<Either<Failure, BrandsListEntity>> call() async {
    return await homeRepo.getBrands();
  }
}
