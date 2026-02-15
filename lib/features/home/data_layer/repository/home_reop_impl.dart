import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/home/data_layer/data_sources/home_data_source.dart';
import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl({
    required this.homeDataSource,
    required DioApiConsumer apiConsumer,
  });

  @override
  Future<Either<Failure, ProductsListEntity>> getProducts() async {
    try {
      final products = await homeDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final product = await homeDataSource.getProductById(id);
      return Right(product);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompaniesListModel>> getCompanies() async {
    try {
      final companies = await homeDataSource.getCompanies();
      return Right(companies);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
