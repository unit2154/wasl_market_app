import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.id,
    required super.name,
    required super.description,
    required super.city,
    required super.country,
    required super.image,
    required super.isActive,
    required super.type,
  });
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      country: json['country'],
      image: json['image'],
      isActive: json['is_active'],
      type: json['type'],
    );
  }
}
