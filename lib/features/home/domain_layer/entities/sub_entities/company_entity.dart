class CompanyEntity {
  final String? type;
  final int id;
  final String name;
  final String? description;
  final String? city;
  final String? country;
  final String? image;
  final String? logo;
  final bool? isActive;

  CompanyEntity({
    this.type,
    required this.id,
    required this.name,
    this.description,
    this.city,
    this.country,
    this.image,
    this.isActive,
    this.logo,
  });
}
