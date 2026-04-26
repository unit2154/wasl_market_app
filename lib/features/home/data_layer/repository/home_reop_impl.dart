import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/home/data_layer/data_sources/home_data_source.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl({
    required this.homeDataSource,
    required DioApiConsumer apiConsumer,
  });

  @override
  Future<Either<Failure, CompaniesListEntity>> getCompanies(int page) async {
    try {
      final companies = await homeDataSource.getCompanies(page);
      return Right(companies);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesListEntity>> getCategories(int page) async {
    try {
      final categories = await homeDataSource.getCategories(page);
      return Right(categories);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandsListEntity>> getBrands(int page) async {
    try {
      final brands = await homeDataSource.getBrands(page);
      return Right(brands);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ItemsListEntity>> filterItems({
    int? category,
    int? company,
    int? brand,
    String? search,
  }) async {
    try {
      final items = await homeDataSource.filterItems(
        category: category,
        company: company,
        brand: brand,
        search: search,
      );
      return Right(items);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
