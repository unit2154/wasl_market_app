import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class FilterItemsUseCase {
  final HomeRepo homeRepo;

  FilterItemsUseCase({required this.homeRepo});

  Future<Either<Failure, ItemsListEntity>> call(FilterParams params) {
    return homeRepo.filterItems(
      category: params.category,
      company: params.company,
      brand: params.brand,
      search: params.search,
    );
  }
}

class FilterParams {
  final int? category;
  final int? company;
  final int? brand;
  final String? search;

  FilterParams({this.category, this.company, this.brand, this.search});
}
