import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/repositories/addresses_repo.dart';

class UpdateAddressUseCase {
  final AddressesRepository addressRepo;

  UpdateAddressUseCase({required this.addressRepo});

  Future<Either<Failure, AddressEntity>> call(AddressEntity address) async {
    return await addressRepo.updateAddress(address);
  }
}
