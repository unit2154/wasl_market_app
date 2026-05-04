import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/core/widgets/submit_button.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/providers/cubit/address_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_item_widget.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_total_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state.status == CartStatus.orderCreated) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.white,
              content: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(AppImages.orderCreated),
              ),
            ),
          );
          context.read<CartCubit>().clearCart();
        }
        if (state.status == CartStatus.failure) {
          showDialog(
            context: context,
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                backgroundColor: AppColors.white,
                title: Text("خطأ"),
                content: Text(state.errorMessage, textAlign: TextAlign.center),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("حسنا"),
                  ),
                ],
              ),
            ),
          );
        }
        if (state.status == CartStatus.addToCart) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("تم الاضافة للسلة")));
        }
        if (state.status == CartStatus.removeFromCart) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("تم الحذف من السلة")));
        }
      },
      builder: (context, state) {
        if (state.status == CartStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.status == CartStatus.success ||
            state.status == CartStatus.addToCart ||
            state.status == CartStatus.removeFromCart ||
            state.status == CartStatus.failure ||
            state.status == CartStatus.clearCart) {
          debugPrint("cart: ${state.cart?.products.length}");
          if (state.cart?.products.isEmpty ?? true) {
            return Center(child: Text("السلة فارغة"));
          }
          return Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return CartItem(item: state.cart!.products[index]);
                },
                itemCount: state.cart?.products.length,
              ),
              // total price and submit button
              Positioned(
                bottom: height * 0.1,
                left: 0,
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    spacing: 10,
                    children: [
                      CartTotalWidget(totalPrice: state.cart?.totalPrice ?? 0),
                      SubmitButton(
                        text: "اتمام الطلب",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("اتمام الطلب"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    BlocBuilder<AddressCubit, AddressState>(
                                      builder: (context, addressState) {
                                        return DropdownButton(
                                          hint: Text("اختر العنوان التوصيل"),
                                          value: addressState.selectedAddressId,
                                          items: addressState.addresses?.map((address) => DropdownMenuItem(value: address.id, child: Text(address.name,maxLines: 1, overflow: TextOverflow.ellipsis))).toList(),
                                          onChanged: (value) {
                                            context.read<AddressCubit>().selectAddress(value!);
                                          },
                                        );
                                      },
                                    ),
                                    
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        constraints: BoxConstraints(
                          maxWidth: width,
                          maxHeight: height,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
