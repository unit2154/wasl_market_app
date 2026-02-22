part of 'store_products_list_cubit.dart';

@immutable
sealed class StoreProductsListState {}

final class ProductsListInitial extends StoreProductsListState {}

final class ProductsListLoading extends StoreProductsListState {}

final class ProductsListLoaded extends StoreProductsListState {
  final List<ProductEntity> productsList;
  ProductsListLoaded(this.productsList);
}

final class ProductsListError extends StoreProductsListState {
  final String error;
  ProductsListError(this.error);
}

final class ProductsListUpdate extends StoreProductsListState {
  final List<ProductEntity> productsList;
  ProductsListUpdate(this.productsList);
}

final class AddProductLoading extends StoreProductsListState {}

final class AddProductSuccess extends StoreProductsListState {}

final class AddProductError extends StoreProductsListState {
  final String error;
  AddProductError(this.error);
}

final class DeleteProductLoading extends StoreProductsListState {}

final class DeleteProductSuccess extends StoreProductsListState {}

final class DeleteProductError extends StoreProductsListState {
  final String error;
  DeleteProductError(this.error);
}
