import 'package:wasl_market_app/features/home/data_layer/models/sub_models/company_model.dart';
import 'package:wasl_market_app/features/ordres/data_layer/models/sub_models/order_item_model.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.masterOrderId,
    required super.customerId,
    required super.companyId,
    required super.status,
    required super.createdAt,
    super.updatedAt,
    required super.orderNumber,
    required super.subtotal,
    required super.totalAmount,
    required super.commissionAmount,
    super.trackingNumber,
    required super.shippingAddress,
    super.shippingLatitude,
    super.shippingLongitude,
    super.notes,
    super.rejectionReason,
    super.confirmedAt,
    super.preparationDeadlineAt,
    super.shippedAt,
    super.deliveredAt,
    super.company,
    super.orderItems,
    super.commission,
    required super.financialStatus,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    // json.forEach((key, value) => print(value));
    return OrderModel(
      id: json['id'],
      masterOrderId: json['master_order_id'],
      orderNumber: json['order_number'],
      customerId: json['customer_id'],
      companyId: json['company_id'],
      status: json['status'],
      subtotal: json['subtotal'],
      totalAmount: json['total_amount'],
      financialStatus: json['financial_status'],
      commissionAmount: json['commission_amount'],
      trackingNumber: json['tracking_number'],
      shippingAddress: json['shipping_address'],
      shippingLatitude: json['shipping_latitude'],
      shippingLongitude: json['shipping_longitude'],
      notes: json['notes'],
      rejectionReason: json['rejection_reason'],
      confirmedAt: json['confirmed_at'],
      preparationDeadlineAt: json['preparation_deadline_at'],
      shippedAt: json['shipped_at'],
      deliveredAt: json['delivered_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null,
      orderItems: (json['order_items'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
    );
  }
}
