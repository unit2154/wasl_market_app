import 'package:wasl_market_app/features/home/data_layer/models/brands_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/categories_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/companies_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/items_list_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/search_suggest_model.dart';

abstract class HomeDataSource {
  Future<CompaniesListModel> getCompanies(int page);
  Future<CategoriesListModel> getCategories(int page);
  Future<BrandsListModel> getBrands(int page);
  Future<ItemsListModel> filterItems({
    int? category,
    int? company,
    int? brand,
    String? search,
    int? page,
  });
  Future<List<SearchSuggestModel>> searchSuggest({required String search});
}
