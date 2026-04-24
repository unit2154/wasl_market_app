import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/core/widgets/search_bar.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/categories_screen.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/category_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/brand_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/company_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.808799;
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getCategoriesAndCompanies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              // search bar
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                expandedHeight: 50,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SearchAnchor.bar(
                      barHintText: "ابحث",
                      barElevation: WidgetStatePropertyAll(0),
                      barBackgroundColor: WidgetStatePropertyAll(
                        AppColors.cardBackground,
                      ),
                      barSide: WidgetStatePropertyAll(
                        BorderSide(color: AppColors.cardBorder),
                      ),
                      barShape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      suggestionsBuilder: (context, controller) {
                        return [SearchInput(height: 50)];
                      },
                    ),
                  ),
                ),
              ),
              // categories
              SliverAppBar(
                // pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.24,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(height: 5),
                      SizedBox(
                        width: width,
                        height: height * 0.05,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "الاصناف",
                              style: TextStyle(fontSize: 16, fontWeight: .bold),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoriesScreen(
                                      categories: state.categories.categories,
                                    ),
                                  ),
                                );
                              },
                              child: Text("مشاهدة الكل"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height * 0.18,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.categories.length,
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                              height: height,
                              category: state.categories.categories[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // companies
              SliverAppBar(
                // pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.35,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: width,
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "الشركات",
                              style: TextStyle(fontSize: 16, fontWeight: .bold),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text("مشاهدة الكل"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height * 0.25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.companies.companies.length,
                          itemBuilder: (context, index) {
                            return CompanyWidget(
                              height: height,
                              company: state.companies.companies[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // brands
              SliverAppBar(
                // pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.22,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: width,
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "الماركات",
                              style: TextStyle(fontSize: 16, fontWeight: .bold),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text("مشاهدة الكل"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height * 0.13,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.brands.brands.length,
                          itemBuilder: (context, index) {
                            return BrandWidget(
                              brand: state.brands.brands[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // items
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: state.items.items.length,
                itemBuilder: (context, index) {
                  return Product(
                    product: state.items.items[index],
                    constraints: BoxConstraints(
                      maxWidth: width,
                      maxHeight: height * 0.25,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
