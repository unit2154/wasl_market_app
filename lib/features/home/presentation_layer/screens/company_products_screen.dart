import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/product_widget.dart';

class CompanyProductsScreen extends StatelessWidget {
  final ProfileEntity company;
  const CompanyProductsScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.of(context).padding.top),
            ),
            SliverAppBar(
              expandedHeight: height * 0.3,
              pinned: false,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white.withValues(alpha: 0.6),
                    child: Icon(Icons.arrow_back, color: AppColors.primary),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    // company image
                    Column(
                      children: [
                        SizedBox(
                          height: height * 0.24,
                          child: Image.asset(
                            AppImages.company,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          height: height * 0.11,
                          color: Colors.black.withAlpha(0),
                        ),
                      ],
                    ),
                    // company name and delivery time and origin
                    Positioned(
                      top: (height * 0.2),
                      right: width * 0.1,
                      child: Container(
                        width: width * 0.8 + 2,
                        height: height * 0.155 + 2,
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: AppColors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.0775,
                              child: Center(
                                // company name
                                child: Text(
                                  company.name,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.4,
                                  height: height * 0.0775,
                                  decoration: ShapeDecoration(
                                    shape: Border(
                                      top: BorderSide(
                                        color: AppColors.cardBorder,
                                      ),
                                      left: BorderSide(
                                        color: AppColors.cardBorder,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("وقت التوصيل"),
                                        SizedBox(height: 5),
                                        Text(
                                          "24 - 48 ساعة",
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.4,
                                  height: height * 0.0775,
                                  decoration: ShapeDecoration(
                                    shape: Border(
                                      top: BorderSide(
                                        color: AppColors.cardBorder,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("التصنيف"),
                                        SizedBox(height: 5),
                                        Text(
                                          "محلية",
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: (context.read<HomeCubit>().state as HomeSuccess)
                  .products
                  .length,
              itemBuilder: (context, index) {
                return Product(
                  product: (context.read<HomeCubit>().state as HomeSuccess)
                      .products[index],
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: MediaQuery.of(context).size.height * 0.807899,
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.of(context).padding.bottom),
            ),
          ],
        ),
      ),
    );
  }
}
