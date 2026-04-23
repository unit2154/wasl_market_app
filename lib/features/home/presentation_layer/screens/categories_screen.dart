import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/category_entity.dart';
import 'package:wasl_market_app/features/home/presentation_layer/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الاصناف")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryWidget(category: categories[index]);
        },
      ),
    );
  }
}
