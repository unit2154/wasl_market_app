import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/sub_entities/commission_entity.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/sub_entities/order_item_entity.dart';

class OrderEntity {
  final int id;
  final int? masterOrderId;
  final String orderNumber;
  final int customerId;
  final int companyId;
  final String status;
  final String financialStatus;
  final String subtotal;
  String totalAmount;
  final String commissionAmount;
  final String? trackingNumber;
  final String shippingAddress;
  final String? shippingLatitude;
  final String? shippingLongitude;
  final String? notes;
  final String? rejectionReason;
  final String? confirmedAt;
  final String? preparationDeadlineAt;
  final String? shippedAt;
  final String? deliveredAt;
  final String createdAt;
  final String? updatedAt;
  final CompanyEntity? company;
  List<OrderItemEntity>? orderItems;
  final CommissionEntity? commission;

  OrderEntity({
    required this.id,
    required this.masterOrderId,
    required this.orderNumber,
    required this.customerId,
    required this.companyId,
    required this.status,
    required this.subtotal,
    required this.totalAmount,
    required this.commissionAmount,
    this.trackingNumber,
    required this.shippingAddress,
    this.notes,
    this.confirmedAt,
    this.preparationDeadlineAt,
    this.shippedAt,
    this.deliveredAt,
    required this.createdAt,
    this.updatedAt,
    this.company,
    this.orderItems,
    this.commission,
    required this.financialStatus,
    this.shippingLatitude,
    this.shippingLongitude,
    this.rejectionReason,
  });
}
