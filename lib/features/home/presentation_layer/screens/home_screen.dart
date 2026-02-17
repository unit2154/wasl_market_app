import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/core/widgets/search_bar.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/company_card_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getProductsAndCompanies(),
      child: DefaultTabController(
        length: 2,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchInput(height: 50),
                TabBar(
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                  unselectedLabelStyle: const TextStyle(fontSize: 16),
                  indicatorColor: AppColors.primaryColor,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'الشركات'),
                    Tab(text: 'المنتجات'),
                  ],
                ),
                SizedBox(height: 5),
                Expanded(
                  child: TabBarView(
                    children: [
                      RefreshIndicator(
                        onRefresh: () =>
                            getIt<HomeCubit>().getProductsAndCompanies(),
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return state is HomeSuccess
                                ? ListView.builder(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                          0.1,
                                      left: 10,
                                      right: 10,
                                    ),
                                    itemCount:
                                        (state).companies.companies.length,
                                    itemBuilder: (context, index) {
                                      return CompanyCard(
                                        company:
                                            (state).companies.companies[index],
                                      );
                                    },
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: () =>
                            getIt<HomeCubit>().getProductsAndCompanies(),
                        child: state is HomeSuccess
                            ? GridView.builder(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.1,
                                  left: 10,
                                  right: 10,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.8,
                                    ),
                                itemCount: (state).products.length,
                                itemBuilder: (context, index) {
                                  return Product(
                                    product: (state).products[index],
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                          0.807899,
                                    ),
                                  );
                                },
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
