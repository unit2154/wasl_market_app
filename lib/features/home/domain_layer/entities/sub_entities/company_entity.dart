class CompanyEntity {
  final String type;
  final int id;
  final String name;
  final String? description;
  final String? city;
  final String? country;
  final String? image;
  final bool isActive;

  CompanyEntity({
    required this.type,
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.country,
    required this.image,
    required this.isActive,
  });
}
