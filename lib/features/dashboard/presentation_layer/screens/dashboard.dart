import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/core/widgets/search_bar.dart';
import 'package:wasl_market_app/core/widgets/side_menu.dart';
import 'package:wasl_market_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_market_app/features/dashboard/presentation_layer/widgets/custom_bottom_nav_bar.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/home_screen.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/screens/commission.screen.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/screens/orders_map_screen.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/screens/orders_screen.dart';

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
        ],
        child: BlocBuilder<DashboardCubit, DashboardInitial>(
          builder: (context, state) {
            context.read<OrdersCubit>().refreshOrders();
            return Scaffold(
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
                    ? Text('التعاملات')
                    : Row(
                        children: [
                          CircleAvatar(child: Image.asset(AppImages.logo)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            (context.read<AuthCubit>().state
                                    as VerifyOtpSuccess)
                                .user
                                .profile
                                .name,
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
              ),
              drawer: const SideMenu(),
              body: IndexedStack(
                index: state.currentIndex,
                children: [
                  const OrdersScreen(),
                  const Center(child: Text('الرئيسية')),
                  HomeScreen(),
                  const Center(child: Text('الرئيسية')),
                  const CommissionScreen(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
