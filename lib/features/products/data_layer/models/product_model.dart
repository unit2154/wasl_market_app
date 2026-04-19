import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_market_app/features/products/domain_layer/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    super.sku,
    required super.price,
    required super.stockQuantity,
    required super.availabilityStatus,
    super.images,
    required super.unit,
    required super.minOrderQuantity,
    required super.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    super.profile,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name']['en'],
      description: json['description']['en'],
      sku: json['sku'],
      price: json['price'],
      stockQuantity: json['stock_quantity'],
      availabilityStatus: json['availability_status'],
      images: json['images'] ?? [],
      unit: json['unit'],
      minOrderQuantity: json['min_order_quantity'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      profile: json['customer'] != null
          ? ProfileModel.fromJson(json['customer'])
          : null,
    );
  }
}
