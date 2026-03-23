import 'package:wasl_market_app/core/models/link_model.dart';
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
    required super.links,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory MasterOrderListModel.fromJson(Map<String, dynamic> json) {
    return MasterOrderListModel(
      currentPage: json['current_page'],
      orders: (json['data']! as List)
          .map((e) => MasterOrderModel.fromJson(e))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'] ?? 0,
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links']! as List)
          .map((e) => LinkModel.fromJson(e))
          .toList(),
      nextPageUrl: json['next_page_url'] ?? "",
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'] ?? "",
      to: json['to'] ?? 0,
      total: json['total'],
    );
  }
}
