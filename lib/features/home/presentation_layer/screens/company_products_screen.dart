import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/constants/images.dart';
import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/product_widget.dart';

class CompanyProductsScreen extends StatelessWidget {
  final ProfileEntity company;
  const CompanyProductsScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.of(context).padding.top),
            ),
            SliverAppBar(
              expandedHeight: 200,
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
                background: Image.asset(AppImages.company, fit: BoxFit.cover),
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
          ],
        ),
      ),
    );
  }
}
