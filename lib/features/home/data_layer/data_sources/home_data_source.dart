import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/product_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/products_list_model.dart';

abstract class HomeDataSource {
  Future<ProductsListModel> getProducts();
  Future<ProductModel> getProductById(int id);
  Future<CompaniesListModel> getCompanies();
}
