import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  BrandModel({
    required super.type,
    required super.id,
    required super.name,
    required super.slug,
    required super.status,
    required super.image,
    required super.icon,
    required super.cover,
    required super.itemsCount,
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
