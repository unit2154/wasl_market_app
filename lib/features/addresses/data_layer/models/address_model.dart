import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.id,
    required super.city,
    required super.latitude,
    required super.longitude,
    super.createdAt,
    super.updatedAt,
    super.customerId,
    required super.name,
    required super.area,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    try {
      return AddressModel(
        id: json['id'],
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']),
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        customerId: json['customer_id'],
        name: json['name'],
        area: json['area'],
        city: json['city'],
      );
    } on Exception catch (e) {
      debugPrint("AddressModel error: $e");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'name': name,
      'area': area,
      'city': city,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'name': name,
      'area': area,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
