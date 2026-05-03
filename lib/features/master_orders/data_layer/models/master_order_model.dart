import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/ordres/data_layer/models/order_model.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';

class MasterOrderModel extends MasterOrderEntity {
  MasterOrderModel({
    required super.id,
    required super.totalAmount,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.masterOrderNumber,
    required super.paymentType,
    required super.subtotal,
    required super.notes,
    required super.companyOrders,
  });

  factory MasterOrderModel.fromJson(Map<String, dynamic> json) {
    try {
      return MasterOrderModel(
        id: json['id'],
        totalAmount: json['total_amount'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        masterOrderNumber: json['master_order_number'],
        paymentType: json['payment_type'],
        subtotal: json['subtotal'],
        notes: json['notes'],
        companyOrders: (json['company_orders'] as List)
            .map((e) => OrderModel.fromJson(e))
            .toList(),
      );
    } on Exception catch (e) {
      debugPrint("MasterOrderModel error: $e");
      rethrow;
    }
  }
}
