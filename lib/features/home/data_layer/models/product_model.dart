import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';

part 'package:wasl_market_app/core/database/product_model.g.dart';

@HiveType(typeId: DbTypeId.product)
class ProductModel extends ProductEntity {
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  ProductModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.name,
    @HiveField(2) required super.description,
    @HiveField(3) super.sku,
    @HiveField(4) required super.price,
    @HiveField(5) required super.stockQuantity,
    @HiveField(6) required super.availabilityStatus,
    @HiveField(7) super.images,
    @HiveField(8) required super.unit,
    @HiveField(9) required super.minOrderQuantity,
    @HiveField(10) required super.isActive,
    @HiveField(11) required this.createdAt,
    @HiveField(12) required this.updatedAt,
    @HiveField(13) required this.deletedAt,
    @HiveField(14) super.profile,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sku': sku,
      'price': price,
      'stock_quantity': stockQuantity,
      'availability_status': availabilityStatus,
      'images': images,
      'unit': unit,
      'min_order_quantity': minOrderQuantity,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'customer': (profile! as ProfileModel).toJson(),
    };
  }
}
