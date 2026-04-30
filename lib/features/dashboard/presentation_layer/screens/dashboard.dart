import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/core/widgets/side_menu.dart';
import 'package:wasl_market_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/providers/cubit/cart_cubit.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/screens/cart_screen.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/widgets/custom_bottom_nav_bar.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/home_screen.dart';
import 'package:wasl_market_app/features/master_orders/presentation_layer/providers/cubit/master_orders_cubit.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/screens/orders_screen.dart';
import 'package:wasl_market_app/features/products/presentation_layer/providers/cubit/store_products_list_cubit.dart';
import 'package:wasl_market_app/features/products/presentation_layer/screens/store_products_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DashboardCubit()..changeIndex(2)),
          BlocProvider(create: (context) => getIt<OrdersCubit>()..getOrders()),
          BlocProvider(
            create: (context) => getIt<MasterOrdersCubit>()..getMasterOrders(),
          ),
          BlocProvider(create: (context) => getIt<CartCubit>()..getCart()),
          BlocProvider(
            create: (context) => getIt<StoreProductsListCubit>()..getProducts(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<HomeCubit>()..getCategoriesAndCompanies(),
          ),
        ],
        child: BlocBuilder<DashboardCubit, DashboardInitial>(
          builder: (context, state) {
            context.read<OrdersCubit>().refreshOrders();
            return DefaultTabController(
              length: 6,
              child: Scaffold(
                backgroundColor: AppColors.white,
                resizeToAvoidBottomInset: true,
                extendBody: true,
                bottomNavigationBar: CustomBottomNavBar(
                  currentIndex: state.currentIndex,
                  changeIndex: (index) {
                    context.read<DashboardCubit>().changeIndex(index);
                  },
                ),
                appBar: AppBar(
                  backgroundColor: AppColors.white,
                  surfaceTintColor: AppColors.white,
                  title: state.currentIndex == 0
                      ? Text('الطلبات')
                      : state.currentIndex == 1
                      ? Text('العروض')
                      : state.currentIndex == 3
                      ? Text('المنتجات')
                      : state.currentIndex == 4
                      ? Text('سلة المشتريات')
                      : Row(
                          children: [
                            CircleAvatar(child: Image.asset(AppImages.logo)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Text(
                                (context.read<AuthCubit>().state
                                        as VerifyOtpSuccess)
                                    .user
                                    .profile
                                    .name,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                  automaticallyImplyLeading: false,
                  actions: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ],
                  bottom: state.currentIndex == 0
                      ? TabBar(
                          tabAlignment: TabAlignment.start,
                          indicatorColor: AppColors.primaryColor,
                          isScrollable: true,
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: AppColors.textSecondary,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: 'الكل'),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.primaryColor,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("جديدة"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStatePending,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("قيد المراجعة"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStatePending,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("قيد المعالجة"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStatePending,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("بانتضار التاكيد"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStateRejected,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("مرفوضة"),
                                ],
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
                drawer: const SideMenu(),
                body: IndexedStack(
                  index: state.currentIndex,
                  children: [
                    const OrdersScreen(),
                    const Center(child: Text('الرئيسية')),
                    const HomeScreen(),
                    const StoreProductsScreen(),
                    const CartScreen(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
