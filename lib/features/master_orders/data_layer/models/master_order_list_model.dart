import 'package:wasl_market_app/features/master_orders/data_layer/models/master_order_model.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_list_entity.dart';

class MasterOrderListModel extends MasterOrdersListEntity {
  MasterOrderListModel({
    required super.currentPage,
    required super.orders,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory MasterOrderListModel.fromJson(Map<String, dynamic> json) {
    return MasterOrderListModel(
      currentPage: json['meta']['current_page'],
      orders: (json['data'] as List).isNotEmpty
          ? (json['data'] as List)
                .map((e) => MasterOrderModel.fromJson(e))
                .toList()
          : [],
      firstPageUrl: json['links']['first'],
      from: json['meta']['from'] ?? 0,
      lastPage: json['meta']['last_page'],
      lastPageUrl: json['links']['last'],
      nextPageUrl: json['links']['next'] ?? "",
      path: json['meta']['path'],
      perPage: json['meta']['per_page'],
      prevPageUrl: json['links']['prev'] ?? "",
      to: json['meta']['to'] ?? 0,
      total: json['meta']['total'],
    );
  }
}
