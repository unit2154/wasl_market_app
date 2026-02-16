import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';

class CompaniesListModel extends CompaniesListEntity {
  CompaniesListModel({required super.companies});
  factory CompaniesListModel.fromJson(Map<String, dynamic> json) {
    var companies = (json['data'] as List<dynamic>)
        .map(
          (e) => ProfileModel.fromJson(e['customer'] as Map<String, dynamic>),
        )
        .toList();
    companies = {
      for (var company in companies) company.id: company,
    }.values.toList();
    return CompaniesListModel(companies: companies);
  }
}
