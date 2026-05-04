import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';

abstract class AddressesDataSource {
  Future<List<AddressEntity>> getAddresses();
  Future<AddressEntity> addAddress(AddressEntity address);
  Future<AddressEntity> updateAddress(AddressEntity address);
  Future<void> deleteAddress(int id);
}
