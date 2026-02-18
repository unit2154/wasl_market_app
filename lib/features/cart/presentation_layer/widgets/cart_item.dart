import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.08,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.cardBorder)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // product image
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(AppImages.item),
          ),
          SizedBox(width: width * 0.04),
          SizedBox(
            width: width * 0.7,
            child: Stack(
              children: [
                // product details
                Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text("السعر الكلي"),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.location),
                        Text("data"),
                      ],
                    ),
                    Text("500,000 IQD"),
                  ],
                ),
                // delete button
                Positioned(
                  left: 0,
                  top: 0,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text("حذف المنتج"),
                            content: Text("هل انت متاكد من حذف المنتج؟"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("الغاء"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("حذف"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      AppIcons.delete,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                // quantity counter
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppIcons.minus,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppIcons.plus,
                          color: AppColors.primaryColor,
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
    );
  }
}
