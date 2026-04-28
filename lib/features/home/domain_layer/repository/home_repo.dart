import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/search_suggest_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, CompaniesListEntity>> getCompanies(int page);
  Future<Either<Failure, CategoriesListEntity>> getCategories(int page);
  Future<Either<Failure, BrandsListEntity>> getBrands(int page);
  Future<Either<Failure, ItemsListEntity>> filterItems({
    int? category,
    int? company,
    int? brand,
    String? search,
  });
  Future<Either<Failure, List<SearchSuggestEntity>>> searchSuggest({
    String? search,
  });
}
