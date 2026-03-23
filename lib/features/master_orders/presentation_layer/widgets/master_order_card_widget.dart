import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';
import 'package:wasl_market_app/features/master_orders/presentation_layer/screens/master_order_details.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';

class MasterOrderCard extends StatelessWidget {
  final MasterOrderEntity order;
  final BoxConstraints constraints;

  const MasterOrderCard({
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<OrdersCubit>(),
              child: MasterOrderDetails(
                masterOrder: order,
                constraints: constraints,
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
                                  color: AppColors.orderStateNew,
                                  size: width * .02,
                                ),
                                Text(
                                  "طلب رئيسي",
                                  style: TextStyle(
                                    color: AppColors.orderStateNew,
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
                          ).toLocal().toString().substring(0, 10),
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
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        // order total
                        Container(
                          width: width * .4,
                          height: height * .09,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * .01,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // coins icon
                              Container(
                                width: width * .08,
                                height: height * .045,
                                alignment: .center,
                                decoration: BoxDecoration(
                                  color: AppColors.orderStateNewBackground,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset(
                                  AppImages.coins,
                                  height: height * .05,
                                  width: width * .05,
                                ),
                              ),
                              // order total text
                              SizedBox(
                                width: width * .24,
                                child: Column(
                                  mainAxisAlignment: .center,
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      "اجمالي الطلب",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12 * (height / 844),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      order.totalAmount,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 16 * (height / 844),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "دينار عراقي",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 12 * (height / 844),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // sub orders
                        Container(
                          width: width * .4,
                          height: height * .09,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * .01,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * .08,
                                height: height * .045,
                                alignment: .center,
                                decoration: BoxDecoration(
                                  color: AppColors.orderStateNewBackground,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.listTree,
                                  height: height * .04,
                                  width: width * .04,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * .24,
                                child: Column(
                                  mainAxisAlignment: .center,
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      "عدد الطلبات الفرعية",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12 * (height / 844),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      order.companyOrders.length.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 16 * (height / 844),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "طلبات فرعية",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 14 * (height / 844),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
