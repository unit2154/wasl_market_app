class CategoryEntity {
  final int id;
  final int legacyId;
  final int? parentId;
  final String slug;
  final int sortOrder;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String name;
  final String? description;
  final int itemsCount;
  final String? icon;

  CategoryEntity({
    required this.id,
    required this.legacyId,
    required this.parentId,
    required this.slug,
    required this.sortOrder,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.description,
    required this.itemsCount,
    required this.icon,
  });
}
