import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/brand_entity.dart';

part '../../../../../core/database/brand_model.g.dart';

@HiveType(typeId: DbTypeId.brand)
class BrandModel extends BrandEntity {
  BrandModel({
    @HiveField(0) required super.type,
    @HiveField(1) required super.id,
    @HiveField(2) required super.name,
    @HiveField(3) required super.slug,
    @HiveField(4) required super.status,
    @HiveField(5) required super.image,
    @HiveField(6) required super.icon,
    @HiveField(7) required super.cover,
    @HiveField(8) required super.itemsCount,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      type: json['type'],
      id: json['id'],
      name: json['name']['ar'], //[AppLang.isAr ? 'ar' : 'en'],
      slug: json['slug'],
      status: json['status'],
      image: json['image'],
      icon: json['icon'],
      cover: json['cover'],
      itemsCount: json['items_count'],
    );
  }
}
