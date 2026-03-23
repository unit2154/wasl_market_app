import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/core/exceptions/exceptions.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/master_orders/data_layer/models/master_order_list_model.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_list_entity.dart';

abstract class MasterOrdersDataSource {
  Future<MasterOrdersListEntity> getMasterOrders();
}

class MasterOrdersDataSourceImpl implements MasterOrdersDataSource {
  final DioApiConsumer apiConsumer;
  final Box<TokenEntity> tokenBox;
  MasterOrdersDataSourceImpl({
    required this.apiConsumer,
    required this.tokenBox,
  });

  @override
  Future<MasterOrdersListEntity> getMasterOrders() async {
    try {
      final response = await apiConsumer.get(
        Endpoints.masterOrders,
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenBox.getAt(0)?.token}",
        },
      );
      return MasterOrderListModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.response?.data['message'] ?? e.response?.data['error']);
      throw ServerException(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            e.toString(),
      );
    }
  }
}
