import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/exceptions/exceptions.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_market_app/features/cart/data_layer/datasources/cart_data_source.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';

class CartDataSourceImpl implements CartDataSource {
  final DioApiConsumer apiService;
  final Box<TokenEntity> tokenBox;
  CartDataSourceImpl({required this.apiService, required this.tokenBox});
  @override
  Future<void> createNewOrder(NewOrderEntity order) async {
    try {
      await apiService.post(
        Endpoints.createNewOrder,
        headers: {"Authorization": "Bearer ${tokenBox.getAt(0)?.token}"},
        data: order.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            'حدث خطأ ما',
      );
    }
  }
}
