import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/search_suggest_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';

class SearchSuggestUseCase {
  final HomeRepo homeRepo;
  SearchSuggestUseCase({required this.homeRepo});
  Future<Either<Failure, List<SearchSuggestEntity>>> call(String params) async {
    return await homeRepo.searchSuggest(search: params);
  }
}
