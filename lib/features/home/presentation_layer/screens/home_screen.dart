import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/presentation_layer/widgets/cart_item_widget.dart';
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
    final companiesScrollController = ScrollController();
    final itemsScrollController = ScrollController();

    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getCategoriesAndCompanies(),
      child: BlocConsumer<HomeCubit, HomeState>(
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
          }
        },
        builder: (context, state) {
          debugPrint("items: ${state.items.items.length}");
          companiesScrollController.addListener(() {
            if (companiesScrollController.position.pixels ==
                companiesScrollController.position.maxScrollExtent) {
              int page = state.companies.nextPageUrl != null
                  ? int.parse(state.companies.nextPageUrl!.split("page=")[1])
                  : 0;
              if (page != 0) {
                context.read<HomeCubit>().getNextPage(
                  nextPageModel: NextPageModel(companiesPage: page),
                );
              }
            }
          });
          itemsScrollController.addListener(() async {
            if (itemsScrollController.position.pixels ==
                itemsScrollController.position.maxScrollExtent) {
              int page = state.items.nextPageUrl != null
                  ? int.parse(state.items.nextPageUrl!.split("page=")[1])
                  : 0;
              if (page != 0) {
                await context.read<HomeCubit>().getNextPage(
                  nextPageModel: NextPageModel(itemsPage: page),
                );
              }
            }
          });
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
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SearchAnchor.bar(
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
                              suggestionsBuilder: (context, controller) {
                                return List.generate(
                                  state.items.items.length,
                                  (index) => CartItem(
                                    item: CartItemEntity(
                                      product: state.items.items[index],
                                      quantity: 1,
                                    ),
                                    searchItem: true,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 5),
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
                    // snap: true,
                    surfaceTintColor: AppColors.cardBackground,
                    backgroundColor: AppColors.white,
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
                    // pinned: true,
                    // floating: true,
                    // snap: true,
                    surfaceTintColor: AppColors.cardBackground,
                    backgroundColor: AppColors.white,
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
      ),
    );
  }
}
