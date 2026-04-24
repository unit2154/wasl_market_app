import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({super.key, required this.height, required this.company});

  final double height;
  final CompanyEntity company;

  @override
  Widget build(BuildContext context) {
    // final image = company.image != null
    //     ? 'https://vorhex.com${company.image!}'
    //     : '';
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().filterProducts(
          filter: FilterModel(category: null, company: company.id, brand: null),
        );
      },
      child: Container(
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
              height: height * .2,
              width: 130,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: company.image!,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.logo),
                ),
              ),
            ),
            Container(
              height: height * .0471,
              width: 130,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.primaryColor)),
                color:
                    context.read<HomeCubit>().state.filter?.company ==
                        company.id
                    ? AppColors.primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    company.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: .bold,
                      color:
                          context.read<HomeCubit>().state.filter?.company ==
                              company.id
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
