import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/addresses/data_layer/datasources/addresses_data_source.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/repositories/addresses_repo.dart';

class AddressesRepoImpl implements AddressesRepository {
  final AddressesDataSource addressesDataSource;
  AddressesRepoImpl({required this.addressesDataSource});

  @override
  Future<Either<Failure, AddressEntity>> addAddress(
    AddressEntity address,
  ) async {
    try {
      final addressEntity = await addressesDataSource.addAddress(address);
      return Right(addressEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(int id) async {
    try {
      await addressesDataSource.deleteAddress(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      final addresses = await addressesDataSource.getAddresses();
      return Right(addresses);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> updateAddress(
    AddressEntity address,
  ) async {
    try {
      final addressEntity = await addressesDataSource.updateAddress(address);
      return Right(addressEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
