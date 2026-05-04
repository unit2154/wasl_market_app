import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';

part '../../../../../core/database/company_model.g.dart';

@HiveType(typeId: DbTypeId.company)
class CompanyModel extends CompanyEntity {
  CompanyModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.name,
    @HiveField(2) super.description,
    @HiveField(3) super.city,
    @HiveField(4) super.country,
    @HiveField(5) super.image,
    @HiveField(6) super.isActive,
    @HiveField(7) super.type,
  });
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    try {
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
    } catch (e) {
      debugPrint('CompanyModel: $e');
      rethrow;
    }
  }
}
