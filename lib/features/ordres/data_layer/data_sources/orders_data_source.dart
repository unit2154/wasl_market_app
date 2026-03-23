import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/core/exceptions/exceptions.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/ordres/data_layer/models/order_list_model.dart';
import 'package:wasl_market_app/features/ordres/data_layer/models/order_model.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/orders_list_entity.dart';

abstract class OrdersDataSource {
  Future<OrdersListEntity> getOrders();
  Future<void> updateOrderState(String orderId, String status);
  Future<void> editOrder(OrderModel order);
}

class OrdersDataSourceImpl implements OrdersDataSource {
  final DioApiConsumer apiConsumer;
  final Box<TokenEntity> tokenBox;
  OrdersDataSourceImpl({required this.apiConsumer, required this.tokenBox});

  @override
  Future<OrdersListEntity> getOrders() async {
    try {
      final response = await apiConsumer.get(
        Endpoints.orders,
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenBox.getAt(0)?.token}",
        },
      );
      return OrdersListModel.fromJson(response.data);
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

  @override
  Future<void> updateOrderState(String orderId, String status) async {
    try {
      await apiConsumer.put(
        "${Endpoints.orders}/$orderId",
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenBox.getAt(0)?.token}",
        },
        data: {"status": status, "notes": "", "tracking_number": ""},
      );
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

  @override
  Future<void> editOrder(OrderModel order) {
    // TODO: implement editOrder
    throw UnimplementedError();
  }
}
