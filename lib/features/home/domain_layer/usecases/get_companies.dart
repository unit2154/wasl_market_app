import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class GetCompaniesUseCase {
  final HomeRepo homeRepo;
  GetCompaniesUseCase({required this.homeRepo});
  Future<Either<Failure, CompaniesListEntity>> call() async {
    return await homeRepo.getCompanies();
  }
}
