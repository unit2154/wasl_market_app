import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/products_list_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProductsListEntity>> getProducts();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
  Future<Either<Failure, CompaniesListModel>> getCompanies();
}
