import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/products_list_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProductsListEntity>> getProducts();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
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
