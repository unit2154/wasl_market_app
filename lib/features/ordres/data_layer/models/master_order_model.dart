import 'package:wasl_market_app/features/ordres/domain_layer/entities/master_order_entity.dart';

class MasterOrderModel extends MasterOrderEntity {
  MasterOrderModel({
    required super.id,
    required super.customerId,
    required super.totalAmount,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.masterOrderNumber,
    required super.paymentType,
    required super.subtotal,
    required super.notes,
    required super.deletedAt,
    required super.companyOrders,
  });

  factory MasterOrderModel.fromJson(Map<String, dynamic> json) {
    return MasterOrderModel(
      id: json['id'],
      customerId: json['customer_id'],
      totalAmount: json['total_amount'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      masterOrderNumber: json['master_order_number'],
      paymentType: json['payment_type'],
      subtotal: json['subtotal'],
      notes: json['notes'],
      deletedAt: json['deleted_at'],
      companyOrders: json['company_orders'],
    );
  }
}
