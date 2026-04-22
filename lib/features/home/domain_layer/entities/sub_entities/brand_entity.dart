class BrandEntity {
  final String type;
  final int id;
  final String name;
  final String slug;
  final String status;
  final String? image;
  final String? icon;
  final String? cover;
  final int itemsCount;

  BrandEntity({
    required this.type,
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.image,
    required this.icon,
    required this.cover,
    required this.itemsCount,
  });
}
