import 'package:wasl_market_app/features/home/data_layer/models/brands_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/categories_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/items_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/product_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/products_list_model.dart';

abstract class HomeDataSource {
  Future<ProductsListModel> getProducts();
  Future<ProductModel> getProductById(int id);
  Future<CompaniesListModel> getCompanies();
  Future<CategoriesListModel> getCategories();
  Future<BrandsListModel> getBrands();
  Future<ItemsListModel> filterItems({
    int? category,
    int? company,
    int? brand,
    String? search,
  });
}
