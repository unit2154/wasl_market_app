import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String? image;
  final bool? isSelected;
  final int index;
  const CategoryWidget({
    super.key,
    required this.title,
    required this.image,
    this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: isSelected == true
            ? AppColors.primaryColor
            : AppColors.cardBackground,
      ),
      child: Column(
        crossAxisAlignment: .center,
        children: [
          Container(
            width: 100,
            height: 65,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(AppImages.logo, width: 100, height: 100),
          ),
          SizedBox(
            height: 39,
            width: 70,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: isSelected == true ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
