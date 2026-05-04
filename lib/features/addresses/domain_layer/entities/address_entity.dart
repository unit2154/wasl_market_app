class AddressEntity {
  final int? id;
  final int? customerId;
  final String name;
  final double latitude;
  final double longitude;
  final String city;
  final String area;
  final String? createdAt;
  final String? updatedAt;

  AddressEntity({
    this.id,
    this.customerId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.area,
    this.createdAt,
    this.updatedAt,
  });
}
