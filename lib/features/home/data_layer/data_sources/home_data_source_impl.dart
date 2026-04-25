import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_market_app/features/home/data_layer/data_sources/home_data_source.dart';
import 'package:wasl_market_app/features/home/data_layer/models/brands_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/categories_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/items_list_model.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final DioApiConsumer dio;
  final Box<TokenEntity> tokenBox;
  final Box<UserEntity> userBox;
  HomeDataSourceImpl({
    required this.dio,
    required this.tokenBox,
    required this.userBox,
  });
  
  @override
  Future<CompaniesListModel> getCompanies() async {
    try {
      final response = await dio.get(
        Endpoints.companies,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: {'page': 1, 'per_page': 100},
      );
      return CompaniesListModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            e.response?.data.toString() ??
            e.toString(),
      );
    }
  }

  @override
  Future<CategoriesListModel> getCategories() async {
    try {
      final response = await dio.get(
        Endpoints.categories,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
      );
      debugPrint(response.data.toString());
      return CategoriesListModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            e.response?.data.toString() ??
            e.toString(),
      );
    }
  }

  @override
  Future<BrandsListModel> getBrands() async {
    try {
      final response = await dio.get(
        Endpoints.brands,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: {'page': 1, 'per_page': 100},
      );
      debugPrint(response.data.toString());
      return BrandsListModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            e.response?.data.toString() ??
            e.toString(),
      );
    }
  }

  @override
  Future<ItemsListModel> filterItems({int? category, int? company, int? brand, String? search}) async {
    try {
      final response = await dio.get(
        category != null ? '${Endpoints.categories}/$category/items' : 
        company != null ? '${Endpoints.companies}/$company/items' : 
        brand != null ? '${Endpoints.brands}/$brand/items' : 
        Endpoints.products,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: {
          'page': 1,
          'per_page': 100,
        },
      );
      return ItemsListModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.response?.data.toString());
      throw ServerFailure(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            e.response?.data.toString() ??
            e.toString(),
      );
    }
  }
}
