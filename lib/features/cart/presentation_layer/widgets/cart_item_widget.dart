import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity item;
  final bool searchItem;
  const CartItem({super.key, required this.item, this.searchItem = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ValueNotifier<int> quantity = ValueNotifier<int>(item.quantity);
    return Container(
      width: width,
      height: height * 0.08,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.cardBorder)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // product image
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CachedNetworkImage(
              imageUrl: item.product.catalogItem.image,
              width: width * 0.1,
              height: height * 0.1,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
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
                    Text(
                      item.product.catalogItem.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.location),
                        Text(item.product.company.name),
                      ],
                    ),
                    Text("${item.product.price} IQD"),
                  ],
                ),
                // delete button
                !searchItem
                    ? Positioned(
                        left: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
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
                                        context
                                            .read<CartCubit>()
                                            .removeFromCart(item);
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
                      )
                    : SizedBox.shrink(),
                // quantity counter
                !searchItem
                    ? Positioned(
                        left: 0,
                        bottom: 0,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (quantity.value > 1) {
                                  quantity.value--;
                                  context.read<CartCubit>().updateCart(
                                    item,
                                    quantity.value,
                                  );
                                }
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset(
                                  AppIcons.minus,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: ValueListenableBuilder(
                                valueListenable: quantity,
                                builder: (context, value, child) {
                                  return Text(
                                    "$value",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                quantity.value++;
                                context.read<CartCubit>().updateCart(
                                  item,
                                  quantity.value,
                                );
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset(
                                  AppIcons.plus,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
