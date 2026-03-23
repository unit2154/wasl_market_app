import 'package:wasl_market_app/core/entites/link_entity.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';

class MasterOrdersListEntity {
  final int currentPage;
  final List<MasterOrderEntity>? orders;
  final String firstPageUrl;
  final int? from;
  final int lastPage;
  final String lastPageUrl;
  final List<LinkEntity>? links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  MasterOrdersListEntity({
    required this.currentPage,
    this.orders,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });
}
