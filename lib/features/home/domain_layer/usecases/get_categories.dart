import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class GetCategoriesUseCase {
  final HomeRepo homeRepo;
  GetCategoriesUseCase({required this.homeRepo});

  Future<Either<Failure, CategoriesListEntity>> call() async {
    return await homeRepo.getCategories();
  }
}
