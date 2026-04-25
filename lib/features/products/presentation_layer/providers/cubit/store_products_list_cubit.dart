import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/item_entity.dart';
import 'package:wasl_market_app/features/products/domain_layer/usecases/get_store_products.dart';
part 'store_products_list_state.dart';

class StoreProductsListCubit extends Cubit<StoreProductsListState> {
  final GetStoreProductsUseCase getProductsUseCase;

  static List<ItemEntity> products = [];

  StoreProductsListCubit({required this.getProductsUseCase})
    : super(ProductsListInitial());

  Future<void> getProducts() async {
    emit(ProductsListLoading());
    final result = await getProductsUseCase();
    result.fold((l) => emit(ProductsListError(l.message)), (r) {
      products = r.items;
      emit(ProductsListLoaded(r.items));
    });
  }

  void updateUI(ItemEntity product) {
    int index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    emit(ProductsListLoaded(List<ItemEntity>.from(products)));
  }
}
