import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_companies.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCompaniesUseCase getCompaniesUseCase;
  HomeCubit({
    required this.getProductsUseCase,
    required this.getCompaniesUseCase,
  }) : super(HomeInitial());

  Future<void> getProductsAndCompanies() async {
    emit(HomeLoading());
    try {
      final products = await getProductsUseCase();
      products.fold((l) => emit(HomeFailure(message: l.message)), (p) async {
        final companies = await getCompaniesUseCase();
        companies.fold((l) => emit(HomeFailure(message: l.message)), (c) {
          emit(HomeSuccess(products: p.products, companies: c));
        });
      });
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
