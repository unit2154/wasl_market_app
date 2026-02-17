import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_market_app/core/constants/images.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(children: [Text("data"), Text("dsfsdfsdf")]),
            ),
          ],
        ),
      ),
    );
  }
}
