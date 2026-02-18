import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/widgets/submit_button.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_item.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_total_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              CartItem(),
              SizedBox(height: height * 0.01),
              CartItem(),
            ],
          ),
          // total price and submit button
          Positioned(
            bottom: height * 0.1,
            left: 0,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                spacing: 10,
                children: [
                  CartTotalWidget(totalPrice: 500000),
                  SubmitButton(
                    text: "اتمام الطلب",
                    onPressed: () {},
                    constraints: BoxConstraints(
                      maxWidth: width,
                      maxHeight: height,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
