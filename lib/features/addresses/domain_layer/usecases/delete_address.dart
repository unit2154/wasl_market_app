import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/repositories/addresses_repo.dart';

class DeleteAddressUseCase {
  final AddressesRepository addressRepo;

  DeleteAddressUseCase({required this.addressRepo});

  Future<Either<Failure, void>> call(int id) async {
    return await addressRepo.deleteAddress(id);
  }
}
