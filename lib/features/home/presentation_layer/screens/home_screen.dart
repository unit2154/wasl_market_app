import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/core/widgets/search_bar.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/categories_screen.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/category_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/company_card_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/company_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/product_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                expandedHeight: 80,
                flexibleSpace: FlexibleSpaceBar(
                  background: SearchInput(height: 50),
                ),
              ),
              // categories
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.18,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(height: 5),
                      SizedBox(
                        width: width,
                        height: 40,
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
                                      categories: state is HomeSuccess
                                          ? state.categories.categories
                                          : [],
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
                        height: height * 0.13,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state is HomeSuccess
                              ? state.categories.categories.length
                              : 0,
                          itemBuilder: (context, index) {
                            return state is HomeSuccess
                                ? CategoryWidget(
                                    title:
                                        state.categories.categories[index].name,
                                    image: null,
                                    index: index,
                                    isSelected: index == 0 ? true : false,
                                  )
                                : SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // companies
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.28,
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
                        height: height * 0.20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state is HomeSuccess
                              ? state.companies.companies.length
                              : 0,
                          itemBuilder: (context, index) {
                            return state is HomeSuccess
                                ? CompanyWidget(
                                    height: height,
                                    company: state.companies.companies[index],
                                  )
                                : SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
