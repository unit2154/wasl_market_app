import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/repositories/addresses_repo.dart';

class AddAddressUseCase {
  final AddressesRepository addressRepo;

  AddAddressUseCase({required this.addressRepo});

  Future<Either<Failure, AddressEntity>> call(AddressEntity address) async {
    return await addressRepo.addAddress(address);
  }
}
