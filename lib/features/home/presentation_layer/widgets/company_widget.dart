import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({super.key, required this.height, required this.company});

  final double height;
  final CompanyEntity company;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: height * .2,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * .16,
            width: 130,
            child: company.image != null
                ? Image.network('https://vorhex.com${company.image!}')
                : Image.asset(AppImages.logo),
          ),
          Container(
            height: height * .037,
            width: 130,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.primaryColor)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  company.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: .bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
