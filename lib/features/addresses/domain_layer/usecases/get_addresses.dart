import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/repositories/addresses_repo.dart';

class GetAddressesUseCase {
  final AddressesRepository addressRepo;

  GetAddressesUseCase({required this.addressRepo});

  Future<Either<Failure, List<AddressEntity>>> call() async {
    return await addressRepo.getAddresses();
  }
}
