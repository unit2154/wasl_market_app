import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/brand_entity.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key, required this.brand});

  final BrandEntity brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => MultiBlocProvider(
      //         providers: [
      //           BlocProvider.value(value: context.read<HomeCubit>()),
      //           BlocProvider.value(value: context.read<CartCubit>()),
      //           BlocProvider.value(value: context.read<DashboardCubit>()),
      //         ],
      //         child: CompanyProductsScreen(company: company),
      //       ),
      //     ),
      //   );
      // },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.cardBorder),
          color: AppColors.cardBackground,
          image: DecorationImage(
            image: CachedNetworkImageProvider(brand.cover!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.white.withValues(alpha: 0.6),
              child: CachedNetworkImage(
                imageUrl: brand.icon!,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                brand.name,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18 * MediaQuery.of(context).size.height / 844,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  shadows: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
