import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/products/presentation_layer/providers/cubit/store_products_list_cubit.dart';
import 'package:wasl_market_app/features/products/presentation_layer/widgets/product_widget.dart';

class StoreProductsScreen extends StatelessWidget {
  const StoreProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StoreProductsListCubit, StoreProductsListState>(
        listenWhen: (previous, current) =>
            current is DeleteProductLoading || previous is DeleteProductLoading,
        listener: (context, state) {
          if (state is DeleteProductLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("جاري حذف المنتج")));
          } else if (state is DeleteProductSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("تم حذف المنتج")));
          } else if (state is DeleteProductError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        buildWhen: (previous, current) =>
            current is ProductsListLoading ||
            previous is ProductsListLoading ||
            previous is AddProductSuccess,
        builder: (context, state) {
          if (state is ProductsListInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoaded) {
            return LayoutBuilder(
              builder: (_, constraints) {
                return state.productsList.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () {
                          return context
                              .read<StoreProductsListCubit>()
                              .getProducts();
                        },
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 100,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: state.productsList.length,
                          itemBuilder: (_, index) {
                            return Product(
                              product: state.productsList[index],
                              constraints: constraints,
                              cubitContext: context,
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Text(
                          "لا يوجد منتجات",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 20,
                          ),
                        ),
                      );
              },
            );
          } else if (state is ProductsListError) {
            return Center(
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    "حدث خطأ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<StoreProductsListCubit>().getProducts();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(Icons.refresh, color: AppColors.white),
                        SizedBox(width: 10),
                        Text(
                          "إعادة المحاولة",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ProductsListUpdate) {
            return Center(child: const Text("تم تحديث المنتجات"));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
