import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.05,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.orderStateCompleted),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          spacing: 10,
          children: [
            // coins icon
            SizedBox(
              width: width * 0.06,
              height: height * 0.06,
              child: Image.asset(AppImages.coins, fit: BoxFit.contain),
            ),
            Text(
              "السعر الكلي",
              style: TextStyle(
                color: AppColors.orderStateCompleted,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Text(
              "$totalPrice IQD",
              style: TextStyle(
                color: AppColors.orderStateCompleted,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
