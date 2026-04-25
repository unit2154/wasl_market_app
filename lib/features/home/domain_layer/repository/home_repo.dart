import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, CompaniesListEntity>> getCompanies();
  Future<Either<Failure, CategoriesListEntity>> getCategories();
  Future<Either<Failure, BrandsListEntity>> getBrands();
  Future<Either<Failure, ItemsListEntity>> filterItems({
    int? category,
    int? company,
    int? brand,
    String? search,
  });
}
