import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/screens/categories_screen.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/category_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/brand_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/company_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/product_widget.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/search_suggest_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.808799;
    final companiesScrollController = ScrollController();
    final brandsScrollController = ScrollController();
    final itemsScrollController = ScrollController();
    var searchController = SearchController();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        context.read<HomeCubit>().clearSearchSuggest();
        return;
      }
      if (searchController.text.length > 1) {
        await context.read<HomeCubit>().searchSuggest(
          query: searchController.text,
        );
      }
    });
    itemsScrollController.addListener(() async {
      if (itemsScrollController.position.pixels ==
          itemsScrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().loadNextPage(NextPageModel(itemsPage: 1));
      }
    });
    companiesScrollController.addListener(() {
      if (companiesScrollController.position.pixels ==
          companiesScrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().loadNextPage(NextPageModel(companiesPage: 1));
      }
    });
    brandsScrollController.addListener(() {
      if (brandsScrollController.position.pixels ==
          brandsScrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().loadNextPage(NextPageModel(brandsPage: 1));
      }
    });
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state.stateType == StateType.failure) {
          await showDialog(
            builder: (context) => AlertDialog(
              title: Text("خطأ"),
              content: Text(state.message ?? "حدث خطأ"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("حسنا"),
                ),
              ],
            ),
            context: context,
          );
        } else if (state.stateType == StateType.success &&
            state.items.items.isNotEmpty) {
          final targetOffset = height * 0.90;
          if (itemsScrollController.hasClients &&
              itemsScrollController.offset < targetOffset) {
            itemsScrollController.animateTo(
              targetOffset,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      builder: (context, state) {
        debugPrint("items: ${state.items.items.length}");
        return Stack(
          children: [
            CustomScrollView(
              controller: itemsScrollController,
              slivers: [
                // search and categories
                SliverAppBar(
                  // pinned: true,
                  floating: true,
                  snap: true,
                  surfaceTintColor: AppColors.cardBackground,
                  backgroundColor: AppColors.white,
                  automaticallyImplyLeading: false,
                  expandedHeight: height * 0.33,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        // search bar
                        SizedBox(
                          height: height * .09,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SearchAnchor.bar(
                              searchController: searchController,
                              barHintText: "ابحث",
                              barElevation: WidgetStatePropertyAll(0),
                              barBackgroundColor: WidgetStatePropertyAll(
                                AppColors.white,
                              ),
                              barSide: WidgetStatePropertyAll(
                                BorderSide(color: AppColors.cardBorder),
                              ),
                              barShape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              suggestionsBuilder: (_, searchController) {
                                debugPrint("search ${searchController.text}");
                                return [
                                  BlocProvider.value(
                                    value: context.read<HomeCubit>(),
                                    child: BlocBuilder<HomeCubit, HomeState>(
                                      builder: (context, state) {
                                        if (state.searchSuggests == null) {
                                          return const SizedBox.shrink();
                                        }
                                        return Column(
                                          children: List.generate(
                                            state.searchSuggests!.length,
                                            (index) => SearchSuggestWidget(
                                              onTap: () {
                                                searchController.text = state
                                                    .searchSuggests![index]
                                                    .name;
                                                context
                                                    .read<HomeCubit>()
                                                    .filterProducts(
                                                      filter: FilterModel(
                                                        search: searchController
                                                            .text,
                                                        page: 1,
                                                      ),
                                                    );
                                                searchController.closeView(
                                                  null,
                                                );
                                              },
                                              item:
                                                  state.searchSuggests![index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ];
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        // categories title
                        SizedBox(
                          width: width,
                          height: height * 0.05,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "الاصناف",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: context.read<HomeCubit>(),
                                        child: CategoriesScreen(
                                          categories:
                                              state.categories.categories,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text("مشاهدة الكل"),
                              ),
                            ],
                          ),
                        ),
                        // categories scroll view
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
                  floating: true,
                  surfaceTintColor: AppColors.cardBackground,
                  backgroundColor: AppColors.white,
                  automaticallyImplyLeading: false,
                  expandedHeight: height * 0.35,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        SizedBox(height: 20),
                        // companies title
                        SizedBox(
                          width: width,
                          height: 40,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "الشركات",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text("مشاهدة الكل"),
                              ),
                            ],
                          ),
                        ),
                        // companies scroll view
                        SizedBox(
                          width: width,
                          height: height * 0.25,
                          child: ListView.builder(
                            controller: companiesScrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.companies.companies.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.companies.companies.length) {
                                return state.companies.nextPageUrl != null
                                    ? CircularProgressIndicator()
                                    : SizedBox.shrink();
                              }
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
                  surfaceTintColor: AppColors.cardBackground,
                  backgroundColor: AppColors.white,
                  automaticallyImplyLeading: false,
                  expandedHeight: height * 0.22,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        SizedBox(height: 20),
                        // brands title
                        SizedBox(
                          width: width,
                          height: 40,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "الماركات",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text("مشاهدة الكل"),
                              ),
                            ],
                          ),
                        ),
                        // brands scroll view
                        SizedBox(
                          width: width,
                          height: height * 0.13,
                          child: ListView.builder(
                            controller: brandsScrollController,
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
                // items title
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: width,
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "المنتجات",
                          style: TextStyle(fontSize: 16, fontWeight: .bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // items grid
                SliverPadding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                    bottom: 100,
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.8,
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
                ),
              ],
            ),
            if (state.stateType == StateType.loading) ...[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withValues(alpha: 0.5),
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ],
        );
      },
    );
  }
}
