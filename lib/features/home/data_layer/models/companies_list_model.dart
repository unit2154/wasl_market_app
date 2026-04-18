import 'package:wasl_market_app/features/home/data_layer/models/sub_models/company_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';

class CompaniesListModel extends CompaniesListEntity {
  CompaniesListModel({required super.companies, required super.nextPageUrl});
  factory CompaniesListModel.fromJson(Map<String, dynamic> json) {
    return CompaniesListModel(
      companies: (json['data'] as List)
          .map((e) => CompanyModel.fromJson(e))
          .toList(),
      nextPageUrl: json['next_page_url'],
    );
  }
}
