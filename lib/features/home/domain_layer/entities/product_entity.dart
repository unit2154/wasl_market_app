import 'package:wasl_market_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';

class ProductEntity {
  int id;
  String name;
  String description;
  String? sku;
  String price;
  int stockQuantity;
  String availabilityStatus;
  List<String>? images;
  String unit;
  String minOrderQuantity;
  bool isActive;
  ProfileEntity? profile;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    this.sku,
    required this.price,
    required this.stockQuantity,
    required this.availabilityStatus,
    this.images,
    required this.unit,
    required this.minOrderQuantity,
    required this.isActive,
    this.profile,
  });
}
