import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/core/widgets/submit_button.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.product});

  final ProductEntity product;
  ValueNotifier<int> quantityNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ValueNotifier<int> inCartQuantityNotifier = ValueNotifier<int>(
      context
              .read<CartCubit>()
              .state
              .cart
              ?.products
              .where((element) => element.product.id == product.id)
              .firstOrNull
              ?.quantity ??
          0,
    );
    ValueNotifier<int> cartTotalItemsNotifier = ValueNotifier<int>(
      context.read<CartCubit>().state.cart?.products.length ?? 0,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Row(
            children: [
              // product name
              Text(product.name),
              Spacer(),
              // cart count
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  context.read<DashboardCubit>().changeIndex(4);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: cartTotalItemsNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset(
                      AppIcons.cart,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: BlocListener<CartCubit, CartState>(
          listenWhen: (previous, current) {
            return current.status == CartStatus.addToCart;
          },
          listener: (context, state) {
            inCartQuantityNotifier.value =
                state.cart?.products
                    .firstWhere((element) => element.product.id == product.id)
                    .quantity ??
                0;
            cartTotalItemsNotifier.value = state.cart?.products.length ?? 0;
          },
          child: Stack(
            children: [
              // product image
              Positioned(
                top: 0,
                child: Container(
                  width: width,
                  height: height * 0.3,
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  child: Center(child: Image.asset(AppImages.item)),
                ),
              ),
              // product details
              Positioned(
                top: height * 0.3,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    width: width - 30,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // product name
                        Text(
                          product.name,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                        // product availability status
                        Text(
                          product.availabilityStatus,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.12,
                            letterSpacing: 0.50,
                          ),
                        ),
                        // product price
                        Text(
                          "${product.price} IQD",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.12,
                            letterSpacing: 0.50,
                          ),
                        ),
                        SizedBox(height: 50),
                        // product description title
                        Text(
                          "الوصف",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.12,
                          ),
                        ),
                        // product description
                        Text(
                          product.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.38,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // adjust quantity buttons
              Positioned(
                bottom: 15,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: width - 30,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantityNotifier.value > 1) {
                                  quantityNotifier.value--;
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            // product count
                            ValueListenableBuilder(
                              valueListenable: quantityNotifier,
                              builder: (context, value, child) {
                                return Text(
                                  "$value",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppColors.primaryColor,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                quantityNotifier.value++;
                              },
                              icon: Icon(
                                Icons.add,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SubmitButton(
                          text: "اضافة الى السلة",
                          onPressed: () => context.read<CartCubit>().addToCart(
                            CartItemEntity(
                              product: product,
                              quantity: quantityNotifier.value,
                            ),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: width,
                            maxHeight: height,
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: inCartQuantityNotifier,
                          builder: (context, value, child) {
                            return Text("في السلة $value");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
