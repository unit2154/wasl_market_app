import 'package:wasl_market_app/features/ordres/domain_layer/entities/order_entity.dart';

class MasterOrderEntity {
  final int id;
  final String masterOrderNumber;
  final int customerId;
  final String paymentType;
  final String status;
  final String subtotal;
  final String totalAmount;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final List<OrderEntity> companyOrders;

  MasterOrderEntity({
    required this.id,
    required this.masterOrderNumber,
    required this.customerId,
    required this.paymentType,
    required this.status,
    required this.subtotal,
    required this.totalAmount,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.companyOrders,
  });
}
