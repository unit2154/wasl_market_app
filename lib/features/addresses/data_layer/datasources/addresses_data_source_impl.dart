import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/constants/endpoints.dart';
import 'package:wasl_market_app/core/exceptions/exceptions.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/addresses/data_layer/datasources/addresses_data_source.dart';
import 'package:wasl_market_app/features/addresses/data_layer/models/address_model.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/token_model.dart';

class AddressesDataSourceImpl implements AddressesDataSource {
  final DioApiConsumer apiConsumer;
  final Box<TokenModel> tokenBox;
  AddressesDataSourceImpl({required this.apiConsumer, required this.tokenBox});
  @override
  Future<AddressEntity> addAddress(AddressEntity address) async {
    debugPrint("address: ${(address as AddressModel).toJson()}");
    try {
      final response = await apiConsumer.post(
        Endpoints.addresses,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: address.toJson(),
      );
      final addressEntity = AddressModel.fromJson(response.data);
      debugPrint("addAddress success");
      return addressEntity;
    } on DioException catch (e) {
      debugPrint("addAddress error: ${e.message}");
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<void> deleteAddress(int id) async {
    try {
      await apiConsumer.delete(
        '${Endpoints.addresses}/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
      );
      debugPrint("deleteAddress success");
      return;
    } on DioException catch (e) {
      debugPrint("deleteAddress error: ${e.message}");
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<List<AddressEntity>> getAddresses() async {
    try {
      final response = await apiConsumer.get(
        Endpoints.addresses,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
      );
      return (response.data["data"] as List)
          .map((e) => AddressModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      debugPrint("getAddresses Datasource error: ${e.message}");
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<AddressEntity> updateAddress(AddressEntity address) async {
    try {
      final response = await apiConsumer.put(
        '${Endpoints.addresses}/${address.id}',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${tokenBox.getAt(0)?.token}',
        },
        data: (address as AddressModel).toJson(),
      );
      final addressEntity = AddressModel.fromJson(response.data);
      debugPrint("updateAddress success");
      return addressEntity;
    } on DioException catch (e) {
      debugPrint("updateAddress error: ${e.message}");
      throw ServerException(message: e.message!);
    }
  }
}
