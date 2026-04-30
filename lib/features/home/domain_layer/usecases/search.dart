import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class SearchUsecase {
  final HomeRepo homeRepo;
  SearchUsecase({required this.homeRepo});
  Future<Either<Failure, ItemsListEntity>> call(String search) async {
    return await homeRepo.search(search);
  }
}
