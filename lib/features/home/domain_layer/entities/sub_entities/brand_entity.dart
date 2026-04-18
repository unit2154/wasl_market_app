class BrandEntity {
  final String type;
  final int id;
  final String name;
  final String slug;
  final String status;
  final String? image;
  final int itemsCount;

  BrandEntity({
    required this.type,
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.image,
    required this.itemsCount,
  });
}
