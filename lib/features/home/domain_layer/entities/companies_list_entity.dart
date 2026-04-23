import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';

class CompaniesListEntity {
  final List<CompanyEntity> companies;
  final String? nextPageUrl;
  CompaniesListEntity({required this.companies, this.nextPageUrl});
}
