import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_market_app/features/home/data_layer/data_sources/home_data_source.dart';
import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/product_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/products_list_model.dart';

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
  Future<ProductsListModel> getProducts() async {
    try {
      final response = await dio.get(
        Endpoints.products,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: {'page': 1, 'per_page': 100},
      );
      return ProductsListModel.fromJson(response.data);
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
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await dio.get(
        '${Endpoints.products}/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
      );
      return ProductModel.fromJson(response.data);
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
  Future<CompaniesListModel> getCompanies() async {
    try {
      final response = await dio.get(
        Endpoints.products,
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
}
