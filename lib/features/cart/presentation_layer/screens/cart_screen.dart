import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/widgets/submit_button.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_item.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_total_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.status == CartStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.status == CartStatus.failure) {
          return Center(
            child: Text(
              state.errorMessage ?? "حدث خطأ",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (state.status == CartStatus.success) {
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
                        onPressed: () {},
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
