import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/widgets/order_card_widget.dart';

class MasterOrderDetails extends StatelessWidget {
  final MasterOrderEntity masterOrder;
  final BoxConstraints constraints;
  const MasterOrderDetails({
    super.key,
    required this.masterOrder,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("تفاصيل الطلب الرئيسي")),
        body: Center(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: masterOrder.companyOrders.length,
            itemBuilder: (context, index) => OrderCard(
              order: masterOrder.companyOrders[index],
              constraints: constraints,
            ),
          ),
        ),
      ),
    );
  }
}
