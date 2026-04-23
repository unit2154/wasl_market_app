import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/category_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final finalImage = category.icon?.contains("vorhex.com") == true
        ? category.icon
        : "https://vorhex.com${category.icon}";
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().filterProducts(
          filter: FilterModel(
            category: category.id,
            company: null,
            brand: null,
          ),
        );
      },
      child: Container(
        width: 75,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: context.read<HomeCubit>().state.filter?.category == category.id
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
              child: CachedNetworkImage(
                imageUrl: finalImage!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(AppImages.logo),
              ),
            ),
            SizedBox(
              height: 39,
              width: 70,
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      context.read<HomeCubit>().state.filter?.category ==
                          category.id
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
