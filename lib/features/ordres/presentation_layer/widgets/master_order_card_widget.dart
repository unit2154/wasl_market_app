import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/widgets/order_dialog.dart';

class MasterOrderCardWidget extends StatelessWidget {
  final OrderEntity order;
  final BoxConstraints constraints;

  const MasterOrderCardWidget({
    super.key,
    required this.order,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final double width = constraints.maxWidth;
    final double height = constraints.maxHeight;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<OrdersCubit>(),
            child: Center(
              child: Container(
                width: width * 0.7,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: OrderDialog(order: order, height: height, width: width),
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: height * 0.02),
        child: Column(
          children: [
            Container(
              width: width * 0.9,
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.013,
                ),
                child: Column(
                  spacing: height * 0.01,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    // Order Status
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Container(
                          width: width * 0.24,
                          height: height * 0.038,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppColors.orderStateNewBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: AppColors.primaryColor,
                                  size: width * .02,
                                ),
                                Text(
                                  "طلب رئيسي",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize:
                                        12 *
                                        (MediaQuery.of(context).size.height /
                                            844),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          DateTime.parse(
                            order.createdAt,
                          ).toLocal().toString().substring(0, 16),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: const Color(0xFF646464),
                            fontSize: 14 * (height / 800),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    // Divider
                    Divider(
                      color: AppColors.cardBorder,
                      thickness: 2,
                      height: height * .01,
                    ),
                    // Customer Name and Order Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .2,
                          child: Image.asset(
                            AppImages.coins,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          width: width * .44,
                          height: height * .05,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * .02,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                          ),
                          child: SizedBox(
                            width: width * .2,
                            child: SvgPicture.asset(
                              AppImages.coins,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: width * .275,
                        //   child: Text(
                        //     "رقم الطلب : ${order.orderNumber.split("-")[2]}",
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     textDirection: TextDirection.rtl,
                        //     style: TextStyle(
                        //       color: AppColors.textPrimary,
                        //       fontSize: 14 * (height / 844),
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // Shipping Address
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.location,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          order.shippingAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14 * (height / 650),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    // Total Price
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.coins, width: width * 0.05),
                            SizedBox(width: width * 0.01),
                            Text(
                              "السعر الكلي",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14 * (height / 650),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          "${order.totalAmount} دينار",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14 * (height / 650),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
