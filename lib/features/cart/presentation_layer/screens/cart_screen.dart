import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/core/widgets/submit_button.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/providers/cubit/address_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_item_widget.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_total_widget.dart';
import 'package:wasl_market_app/features/master_orders/presentation_layer/providers/cubit/master_orders_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ValueNotifier<String> selectedPaymentMethod = ValueNotifier(
      'cash_on_delivery',
    );
    TextEditingController notesController = TextEditingController();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state.status == CartStatus.orderCreated) {
          Navigator.pop(context);
          context.read<MasterOrdersCubit>().getMasterOrders();
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
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true, // إذا المحتوى طويل
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (_) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "اتمام الطلب",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: .bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "عنوان التوصيل",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // address
                                      Container(
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.inputBorder,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.1,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  AppIcons.location,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: BlocProvider.value(
                                                value: context
                                                    .read<AddressCubit>(),
                                                child: BlocBuilder<AddressCubit, AddressState>(
                                                  builder: (context, addressState) {
                                                    return DropdownButton(
                                                      isExpanded: true,
                                                      isDense: true,
                                                      underline: SizedBox(),
                                                      value: addressState
                                                          .selectedAddressId,
                                                      items: addressState
                                                          .addresses
                                                          ?.map(
                                                            (
                                                              address,
                                                            ) => DropdownMenuItem(
                                                              value: address.id,
                                                              child: Text(
                                                                address.name,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                              AddressCubit
                                                            >()
                                                            .selectAddress(
                                                              value!,
                                                            );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                      Text(
                                        "طريقة الدفع",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                      // payment method
                                      Container(
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.inputBorder,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        // payment method
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.1,
                                              child: Center(
                                                child: Image.asset(
                                                  AppImages.coins,
                                                  height: height * 0.06,
                                                  width: width * 0.06,
                                                ),
                                              ),
                                            ),
                                            // payment method dropdown
                                            Expanded(
                                              child: ValueListenableBuilder(
                                                valueListenable:
                                                    selectedPaymentMethod,
                                                builder: (context, value, child) {
                                                  return DropdownButton(
                                                    isExpanded: true,
                                                    isDense: true,
                                                    underline: SizedBox(),
                                                    hint: Text(
                                                      "اختر طريقة الدفع",
                                                    ),
                                                    value: selectedPaymentMethod
                                                        .value,
                                                    items:
                                                        [
                                                              {
                                                                "id":
                                                                    "cash_on_delivery",
                                                                "name":
                                                                    "الدفع عند الاستلام",
                                                              },
                                                              {
                                                                "id":
                                                                    "credit_card",
                                                                "name":
                                                                    "الدفع بالبطاقة",
                                                              },
                                                              {
                                                                "id": "wallet",
                                                                "name":
                                                                    "الدفع الاجل",
                                                              },
                                                            ]
                                                            .map(
                                                              (
                                                                paymentMethod,
                                                              ) => DropdownMenuItem(
                                                                value:
                                                                    paymentMethod["id"],
                                                                child: Text(
                                                                  paymentMethod["name"] ??
                                                                      "",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            )
                                                            .toList(),
                                                    onChanged: (value) {
                                                      selectedPaymentMethod
                                                              .value =
                                                          value!;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                      Text(
                                        "الملاحظات",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // notes
                                      TextFormField(
                                        controller: notesController,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: "ادخل ملاحظاتك هنا",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.inputBorder,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                      MultiBlocProvider(
                                        providers: [
                                          BlocProvider.value(
                                            value: context.read<CartCubit>(),
                                          ),
                                          BlocProvider.value(
                                            value: context.read<AddressCubit>(),
                                          ),
                                        ],
                                        child: BlocBuilder<CartCubit, CartState>(
                                          builder: (context, state) {
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                foregroundColor: Colors.white,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 12,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                minimumSize: Size(
                                                  double.infinity,
                                                  50,
                                                ),
                                              ),
                                              onPressed: () {
                                                state.status ==
                                                            CartStatus
                                                                .loading ||
                                                        state.status ==
                                                            CartStatus
                                                                .creatingOrder
                                                    ? null
                                                    : context
                                                          .read<CartCubit>()
                                                          .createNewOrder(
                                                            cart: state.cart!,
                                                            addressId: context
                                                                .read<
                                                                  AddressCubit
                                                                >()
                                                                .state
                                                                .selectedAddressId,
                                                            paymentType:
                                                                selectedPaymentMethod
                                                                    .value,
                                                            notes:
                                                                notesController
                                                                    .text,
                                                          );
                                              },
                                              child: Center(
                                                child:
                                                    state.status ==
                                                        CartStatus.creatingOrder
                                                    ? SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child:
                                                            CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      )
                                                    : Text(
                                                        "تأكيد الطلب",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: .bold,
                                                        ),
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
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
