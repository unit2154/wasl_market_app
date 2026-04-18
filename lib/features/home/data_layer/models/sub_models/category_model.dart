import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.legacyId,
    required super.parentId,
    required super.slug,
    required super.sortOrder,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
    required super.description,
    required super.itemsCount,
    required super.icon,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name']['ar'],
      legacyId: json['legacy_id'],
      parentId: json['parent_id'],
      slug: json['slug'],
      sortOrder: json['sort_order'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      description: json['description']['ku'],
      itemsCount: json['items_count'],
      icon: json['icon'],
    );
  }
}
