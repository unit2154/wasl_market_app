import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:wasl_market_app/features/products/domain_layer/entities/product_entity.dart';
// ignore: unused_import
import 'package:wasl_market_app/features/products/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_market_app/features/products/domain_layer/usecases/get_store_products.dart';
part 'store_products_list_state.dart';

class StoreProductsListCubit extends Cubit<StoreProductsListState> {
  final GetStoreProductsUseCase getProductsUseCase;

  static List<ProductEntity> products = [];

  StoreProductsListCubit({required this.getProductsUseCase})
    : super(ProductsListInitial());

  Future<void> getProducts() async {
    emit(ProductsListLoading());
    final result = await getProductsUseCase();
    result.fold((l) => emit(ProductsListError(l.message)), (r) {
      products = r.products;
      emit(ProductsListLoaded(r.products));
    });
  }

  void updateUI(ProductEntity product) {
    int index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    emit(ProductsListLoaded(List<ProductEntity>.from(products)));
  }
}
