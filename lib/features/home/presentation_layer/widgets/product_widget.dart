import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/item_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/product_details_screen.dart';

class Product extends StatelessWidget {
  final ItemEntity product;
  final BoxConstraints constraints;
  final bool fromCompanyPage;
  const Product({super.key, required this.product, required this.constraints, this.fromCompanyPage = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<CartCubit>()),
                BlocProvider.value(value: context.read<DashboardCubit>()),
              ],
              child: ProductDetailsScreen(item: product, fromCompanyPage: fromCompanyPage),
            ),
          ),
        );
      },
      child: LayoutBuilder(
        builder: (context, cardConstraints) {
          final double cardHeight = cardConstraints.maxHeight;
          return Container(
            margin: EdgeInsets.all(6),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColors.cardBorder),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: cardHeight * 0.58,
                    color: AppColors.cardBackground,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: product.catalogItem.image,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        product.availabilityStatus == "discontinued"
                            ? Positioned(
                                top: -2,
                                left: -34,
                                child: Transform.rotate(
                                  angle: -0.8, // -45 degrees in radians
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 7,
                                      horizontal: 30,
                                    ),
                                    color: Colors.red,
                                    child: Text(
                                      "عرض",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // item name
                        Text(
                          product.catalogItem.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: (cardHeight / 208) * 14,
                            fontWeight: FontWeight.w700,
                            height: cardHeight * 0.007,
                          ),
                        ),

                        // item company name
                        Text(
                          product.company.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: (cardHeight / 208) * 12,
                            fontWeight: FontWeight.w400,
                            height: cardHeight * 0.007,
                          ),
                        ),
                        // item price
                        Text(
                          "${product.price} IQD",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
