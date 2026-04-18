import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_categories.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_companies.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCompaniesUseCase getCompaniesUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  HomeCubit({
    required this.getProductsUseCase,
    required this.getCompaniesUseCase,
    required this.getCategoriesUseCase,
  }) : super(HomeInitial());

  Future<void> getCategoriesAndCompanies() async {
    emit(HomeLoading());
    try {
      final categories = await getCategoriesUseCase();
      categories.fold(
        (l) {
          debugPrint('categoriesssss: $l');
          emit(HomeFailure(message: l.message));
        },
        (cats) async {
          debugPrint('categories: $cats');
          final companies = await getCompaniesUseCase();
          companies.fold(
            (l) {
              debugPrint('companies: $l');
              emit(HomeFailure(message: l.message));
            },
            (comps) {
              debugPrint('categories: $cats');
              debugPrint('companies: $comps');
              emit(
                HomeSuccess(products: [], companies: comps, categories: cats),
              );
            },
          );
        },
      );
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
