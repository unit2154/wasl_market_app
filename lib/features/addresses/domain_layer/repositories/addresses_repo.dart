import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';

abstract class AddressesRepository {
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, void>> deleteAddress(int id);
  Future<Either<Failure, AddressEntity>> addAddress(AddressEntity address);
  Future<Either<Failure, AddressEntity>> updateAddress(AddressEntity address);
}
