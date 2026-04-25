import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_market_app/features/home/data_layer/models/items_list_model.dart';
import 'package:wasl_market_app/features/products/data_layer/data_sources/store_products_data_source.dart';

class StoreProductsDataSourceImpl implements StoreProductsDataSource {
  final DioApiConsumer dio;
  final Box<TokenEntity> tokenBox;
  final Box<UserEntity> userBox;
  StoreProductsDataSourceImpl({
    required this.dio,
    required this.tokenBox,
    required this.userBox,
  });
  @override
  Future<ItemsListModel> getProducts() async {
    try {
      final response = await dio.get(
        Endpoints.endMarketProducts,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: {'page': 1, 'per_page': 100},
      );
      return ItemsListModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
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
