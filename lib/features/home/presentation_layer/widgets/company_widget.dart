import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/company_products_screen.dart';

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
      onTap: () async {
        await context.read<HomeCubit>().filterProducts(
          filter: FilterModel(category: null, company: company.id, brand: null),
        );
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<HomeCubit>()),
                  BlocProvider.value(value: context.read<CartCubit>()),
                  BlocProvider.value(value: context.read<DashboardCubit>()),
                ],
                child: CompanyProductsScreen(company: company),
              ),
            ),
          );
        }
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
              height: height * .047,
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
